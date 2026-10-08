import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

import '../../../app/theme/app_theme.dart';
import '../../../services/progress_service.dart';
import '../../curriculum/models/curriculum_models.dart';
import '../models/quiz_question.dart';

class QuizScreen extends StatefulWidget {
  const QuizScreen({
    super.key,
    required this.lesson,
    required this.questions,
    this.markLessonComplete = true,
  });

  final Lesson lesson;
  final List<QuizQuestion> questions;
  final bool markLessonComplete;

  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  final ProgressService _progressService = ProgressService();

  int _currentIndex = 0;
  int _score = 0;
  int? _selectedIndex;
  bool _answered = false;
  bool _finished = false;
  bool _passed = false;

  QuizQuestion get _question => widget.questions[_currentIndex];

  void _selectOption(int index) {
    if (_answered) return;
    setState(() => _selectedIndex = index);
  }

  Future<void> _checkAnswer() async {
    if (_selectedIndex == null || _answered) return;

    final isCorrect = _selectedIndex == _question.correctIndex;
    setState(() {
      _answered = true;
      if (isCorrect) _score++;
    });

    await _progressService.recordQuestionResult(
      questionId: _question.id,
      isCorrect: isCorrect,
    );
  }

  Future<void> _next() async {
    if (!_answered) return;

    if (_currentIndex < widget.questions.length - 1) {
      setState(() {
        _currentIndex++;
        _selectedIndex = null;
        _answered = false;
      });
      return;
    }

    final minimumScore = math.max(1, (widget.questions.length * 0.6).ceil());
    final passed = _score >= minimumScore;

    if (passed && widget.markLessonComplete) {
      await _progressService.markLessonCompleted(widget.lesson);
    }

    if (!mounted) return;
    setState(() {
      _passed = passed;
      _finished = true;
    });
  }

  void _retry() {
    setState(() {
      _currentIndex = 0;
      _score = 0;
      _selectedIndex = null;
      _answered = false;
      _finished = false;
      _passed = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (_finished) {
      return _ResultView(
        score: _score,
        total: widget.questions.length,
        passed: _passed,
        onRetry: _retry,
        onDone: () => Navigator.of(context).pop(_passed),
      );
    }

    final isDark = Theme.of(context).brightness == Brightness.dark;
    final text = isDark ? AppColors.darkTextPrimary : AppColors.textPrimary;
    final muted =
        isDark ? AppColors.darkTextSecondary : AppColors.textSecondary;
    final surface = isDark ? AppColors.darkSurface : const Color(0xFFFFFDF8);
    final progress = (_currentIndex + 1) / widget.questions.length;

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 18, 20, 0),
              child: _QuizTopBar(
                current: _currentIndex + 1,
                total: widget.questions.length,
                progress: progress,
                textColor: text,
                mutedColor: muted,
                surface: surface,
                onClose: () => Navigator.of(context).pop(),
              ),
            ),
            Expanded(
              child: ListView(
                padding: const EdgeInsets.fromLTRB(20, 28, 20, 120),
                children: [
                  Text(
                    'ركّز في هذا السؤال',
                    style: const TextStyle(
                      color: AppColors.accent,
                      fontWeight: FontWeight.w900,
                      fontSize: 13,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    _question.question,
                    style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                          color: text,
                          fontWeight: FontWeight.w900,
                          height: 1.35,
                          letterSpacing: -0.5,
                        ),
                  )
                      .animate(key: ValueKey(_currentIndex))
                      .fadeIn(duration: 300.ms)
                      .slideY(begin: 0.07, end: 0),
                  const SizedBox(height: 28),
                  ...List.generate(_question.options.length, (index) {
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 13),
                      child: _FocusOption(
                        index: index,
                        text: _question.options[index],
                        selected: _selectedIndex == index,
                        answered: _answered,
                        correctIndex: _question.correctIndex,
                        surface: surface,
                        textColor: text,
                        mutedColor: muted,
                        onTap: () => _selectOption(index),
                      )
                          .animate(
                            key: ValueKey('q$_currentIndex-o$index'),
                            delay: (index * 55).ms,
                          )
                          .fadeIn(duration: 260.ms)
                          .slideX(begin: 0.05, end: 0),
                    );
                  }),
                  if (_answered) ...[
                    const SizedBox(height: 10),
                    _AnswerExplanation(
                      correct: _selectedIndex == _question.correctIndex,
                      text: _question.explanation,
                      surface: surface,
                      mutedColor: muted,
                    ).animate().fadeIn(duration: 250.ms),
                  ],
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: SafeArea(
        minimum: const EdgeInsets.fromLTRB(20, 8, 20, 18),
        child: FilledButton(
          onPressed: _answered
              ? _next
              : (_selectedIndex == null ? null : _checkAnswer),
          style: FilledButton.styleFrom(
            backgroundColor: AppColors.primaryDark,
            foregroundColor: Colors.white,
            disabledBackgroundColor: muted.withValues(alpha: 0.16),
            disabledForegroundColor: muted,
            minimumSize: const Size.fromHeight(58),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
          ),
          child: Text(
            _answered
                ? (_currentIndex == widget.questions.length - 1
                    ? 'عرض النتيجة'
                    : 'السؤال التالي')
                : 'تحقق من الإجابة',
            style: const TextStyle(
              fontWeight: FontWeight.w900,
              fontSize: 15,
            ),
          ),
        ),
      ),
    );
  }
}

class _QuizTopBar extends StatelessWidget {
  const _QuizTopBar({
    required this.current,
    required this.total,
    required this.progress,
    required this.textColor,
    required this.mutedColor,
    required this.surface,
    required this.onClose,
  });

  final int current;
  final int total;
  final double progress;
  final Color textColor;
  final Color mutedColor;
  final Color surface;
  final VoidCallback onClose;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Material(
              color: surface,
              borderRadius: BorderRadius.circular(14),
              child: InkWell(
                onTap: onClose,
                borderRadius: BorderRadius.circular(14),
                child: SizedBox(
                  width: 44,
                  height: 44,
                  child: Icon(Icons.close_rounded, color: textColor),
                ),
              ),
            ),
            const Spacer(),
            Text(
              '$current / $total',
              style: TextStyle(
                color: textColor,
                fontWeight: FontWeight.w900,
              ),
            ),
          ],
        ),
        const SizedBox(height: 18),
        ClipRRect(
          borderRadius: BorderRadius.circular(99),
          child: LinearProgressIndicator(
            value: progress,
            minHeight: 7,
            backgroundColor: mutedColor.withValues(alpha: 0.14),
            valueColor: const AlwaysStoppedAnimation<Color>(
              AppColors.secondary,
            ),
          ),
        ),
      ],
    );
  }
}

class _FocusOption extends StatelessWidget {
  const _FocusOption({
    required this.index,
    required this.text,
    required this.selected,
    required this.answered,
    required this.correctIndex,
    required this.surface,
    required this.mutedColor,
    required this.onTap,
  });

  final int index;
  final String text;
  final bool selected;
  final bool answered;
  final int correctIndex;
  final Color surface;
  final Color mutedColor;
  final VoidCallback onTap;

  static const labels = ['أ', 'ب', 'ج', 'د'];

  @override
  Widget build(BuildContext context) {
    final isCorrect = index == correctIndex;
    final wrongSelected = answered && selected && !isCorrect;

    Color background = surface;
    Color border = mutedColor.withValues(alpha: 0.15);
    Color badge = mutedColor.withValues(alpha: 0.10);
    Color badgeText = textColor;

    if (answered && isCorrect) {
      background = AppColors.primary.withValues(alpha: 0.10);
      border = AppColors.primary;
      badge = AppColors.primary;
      badgeText = Colors.white;
    } else if (wrongSelected) {
      background = AppColors.accent.withValues(alpha: 0.10);
      border = AppColors.accent;
      badge = AppColors.accent;
      badgeText = Colors.white;
    } else if (selected) {
      background = AppColors.secondary.withValues(alpha: 0.24);
      border = AppColors.secondary;
      badge = AppColors.secondary;
      badgeText = AppColors.primaryDark;
    }

    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: answered ? null : onTap,
        borderRadius: BorderRadius.circular(22),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 180),
          padding: const EdgeInsets.all(17),
          decoration: BoxDecoration(
            color: background,
            borderRadius: BorderRadius.circular(22),
            border: Border.all(color: border, width: selected ? 1.8 : 1),
          ),
          child: Row(
            children: [
              AnimatedContainer(
                duration: const Duration(milliseconds: 180),
                width: 40,
                height: 40,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: badge,
                  borderRadius: BorderRadius.circular(13),
                ),
                child: Text(
                  labels[index],
                  style: TextStyle(
                    color: badgeText,
                    fontWeight: FontWeight.w900,
                  ),
                ),
              ),
              const SizedBox(width: 14),
              Expanded(
                child: Text(
                  text,
                  style: TextStyle(
                    color: textColor,
                    fontWeight: FontWeight.w800,
                    height: 1.45,
                  ),
                ),
              ),
              if (answered && isCorrect)
                const Icon(
                  Icons.check_circle_rounded,
                  color: AppColors.primary,
                ),
              if (wrongSelected)
                const Icon(
                  Icons.cancel_rounded,
                  color: AppColors.accent,
                ),
            ],
          ),
        ),
      ),
    );
  }
}

class _AnswerExplanation extends StatelessWidget {
  const _AnswerExplanation({
    required this.correct,
    required this.text,
    required this.surface,
    required this.textColor,
    required this.mutedColor,
  });

  final bool correct;
  final String text;
  final Color surface;
  final Color textColor;
  final Color mutedColor;

  @override
  Widget build(BuildContext context) {
    final accent = correct ? AppColors.primary : AppColors.accent;

    return Container(
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: surface,
        borderRadius: BorderRadius.circular(22),
        border: Border(
          right: BorderSide(color: accent, width: 5),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            correct ? 'إجابة صحيحة' : 'راجع الفكرة',
            style: TextStyle(
              color: accent,
              fontWeight: FontWeight.w900,
            ),
          ),
          const SizedBox(height: 7),
          Text(
            text,
            style: TextStyle(
              color: mutedColor,
              height: 1.65,
            ),
          ),
        ],
      ),
    );
  }
}

class _ResultView extends StatelessWidget {
  const _ResultView({
    required this.score,
    required this.total,
    required this.passed,
    required this.onRetry,
    required this.onDone,
  });

  final int score;
  final int total;
  final bool passed;
  final VoidCallback onRetry;
  final VoidCallback onDone;

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final text = isDark ? AppColors.darkTextPrimary : AppColors.textPrimary;
    final muted =
        isDark ? AppColors.darkTextSecondary : AppColors.textSecondary;
    final percent = ((score / total) * 100).round();

    return Scaffold(
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(24),
            child: Column(
              children: [
                Container(
                  width: 118,
                  height: 118,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: passed ? AppColors.secondary : AppColors.accent,
                    borderRadius: BorderRadius.circular(38),
                  ),
                  child: Text(
                    '$percent%',
                    style: TextStyle(
                      color: passed
                          ? AppColors.primaryDark
                          : Colors.white,
                      fontSize: 30,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                )
                    .animate()
                    .scale(
                      begin: const Offset(0.88, 0.88),
                      end: const Offset(1, 1),
                      duration: 420.ms,
                      curve: Curves.easeOutBack,
                    )
                    .fadeIn(),
                const SizedBox(height: 28),
                Text(
                  passed ? 'أحسنت، أتقنت الدرس' : 'قريب جدًا، حاول مرة أخرى',
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                        color: text,
                        fontWeight: FontWeight.w900,
                        height: 1.2,
                      ),
                ),
                const SizedBox(height: 10),
                Text(
                  '$score من $total إجابات صحيحة',
                  style: TextStyle(
                    color: muted,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const SizedBox(height: 34),
                SizedBox(
                  width: double.infinity,
                  child: FilledButton(
                    onPressed: passed ? onDone : onRetry,
                    style: FilledButton.styleFrom(
                      backgroundColor: AppColors.primaryDark,
                      foregroundColor: Colors.white,
                      minimumSize: const Size.fromHeight(58),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    child: Text(
                      passed ? 'العودة للدرس' : 'أعد الاختبار',
                      style: const TextStyle(fontWeight: FontWeight.w900),
                    ),
                  ),
                ),
                if (!passed) ...[
                  const SizedBox(height: 8),
                  TextButton(
                    onPressed: onDone,
                    child: const Text('العودة بدون إعادة'),
                  ),
                ],
              ],
            ),
          ),
        ),
      ),
    );
  }
}
