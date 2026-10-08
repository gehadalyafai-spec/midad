import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

import '../../../services/progress_service.dart';
import '../../curriculum/models/curriculum_models.dart';
import '../models/quiz_question.dart';

class QuizScreen extends StatefulWidget {
  const QuizScreen({
    super.key,
    required this.lesson,
    required this.questions,
  });

  final Lesson lesson;
  final List<QuizQuestion> questions;

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

  void _checkAnswer() {
    if (_selectedIndex == null || _answered) return;

    final isCorrect = _selectedIndex == _question.correctIndex;
    setState(() {
      _answered = true;
      if (isCorrect) _score++;
    });
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

    if (passed) {
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

    final colors = Theme.of(context).colorScheme;
    final progress = (_currentIndex + 1) / widget.questions.length;

    return Scaffold(
      appBar: AppBar(title: const Text('اختبر نفسك')),
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.fromLTRB(20, 10, 20, 28),
          children: [
            Row(
              children: [
                Expanded(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(99),
                    child: LinearProgressIndicator(
                      value: progress,
                      minHeight: 8,
                      backgroundColor: colors.surfaceContainerHighest,
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                Text(
                  '${_currentIndex + 1}/${widget.questions.length}',
                  style: TextStyle(
                    color: colors.onSurfaceVariant,
                    fontWeight: FontWeight.w800,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 26),
            Text(
              widget.lesson.title,
              style: Theme.of(context).textTheme.labelLarge?.copyWith(
                    color: colors.primary,
                    fontWeight: FontWeight.w800,
                  ),
            ),
            const SizedBox(height: 10),
            Text(
              _question.question,
              style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                    fontWeight: FontWeight.w900,
                    height: 1.45,
                  ),
            ),
            const SizedBox(height: 24),
            ...List.generate(_question.options.length, (index) {
              return Padding(
                padding: const EdgeInsets.only(bottom: 12),
                child: _OptionCard(
                  index: index,
                  text: _question.options[index],
                  selected: _selectedIndex == index,
                  answered: _answered,
                  correctIndex: _question.correctIndex,
                  onTap: () => _selectOption(index),
                )
                    .animate(delay: (index * 45).ms)
                    .fadeIn(duration: 260.ms)
                    .slideY(begin: 0.05, end: 0),
              );
            }),
            if (_answered) ...[
              const SizedBox(height: 8),
              _ExplanationCard(
                isCorrect: _selectedIndex == _question.correctIndex,
                explanation: _question.explanation,
              ).animate().fadeIn(duration: 260.ms),
            ],
            const SizedBox(height: 24),
            FilledButton(
              onPressed: _answered
                  ? _next
                  : (_selectedIndex == null ? null : _checkAnswer),
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 15),
                child: Text(
                  _answered
                      ? (_currentIndex == widget.questions.length - 1
                          ? 'عرض النتيجة'
                          : 'السؤال التالي')
                      : 'تحقق من الإجابة',
                  style: const TextStyle(fontWeight: FontWeight.w900),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _OptionCard extends StatelessWidget {
  const _OptionCard({
    required this.index,
    required this.text,
    required this.selected,
    required this.answered,
    required this.correctIndex,
    required this.onTap,
  });

  final int index;
  final String text;
  final bool selected;
  final bool answered;
  final int correctIndex;
  final VoidCallback onTap;

  static const _labels = ['أ', 'ب', 'ج', 'د'];

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    final isCorrect = index == correctIndex;
    final isWrongSelection = answered && selected && !isCorrect;

    Color borderColor = colors.outlineVariant;
    Color backgroundColor = colors.surface;

    if (answered && isCorrect) {
      borderColor = Colors.green;
      backgroundColor = Colors.green.withValues(alpha: 0.08);
    } else if (isWrongSelection) {
      borderColor = colors.error;
      backgroundColor = colors.error.withValues(alpha: 0.08);
    } else if (selected) {
      borderColor = colors.primary;
      backgroundColor = colors.primaryContainer.withValues(alpha: 0.35);
    }

    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: answered ? null : onTap,
        borderRadius: BorderRadius.circular(18),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 180),
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: backgroundColor,
            borderRadius: BorderRadius.circular(18),
            border: Border.all(color: borderColor, width: selected ? 1.6 : 1),
          ),
          child: Row(
            children: [
              Container(
                width: 34,
                height: 34,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: selected
                      ? colors.primary.withValues(alpha: 0.12)
                      : colors.surfaceContainerHighest,
                ),
                child: Text(
                  _labels[index],
                  style: TextStyle(
                    color: colors.onSurface,
                    fontWeight: FontWeight.w900,
                  ),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Text(
                  text,
                  style: const TextStyle(
                    fontWeight: FontWeight.w700,
                    height: 1.4,
                  ),
                ),
              ),
              if (answered && isCorrect)
                const Icon(Icons.check_circle_rounded, color: Colors.green),
              if (isWrongSelection)
                Icon(Icons.cancel_rounded, color: colors.error),
            ],
          ),
        ),
      ),
    );
  }
}

class _ExplanationCard extends StatelessWidget {
  const _ExplanationCard({
    required this.isCorrect,
    required this.explanation,
  });

  final bool isCorrect;
  final String explanation;

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    final accent = isCorrect ? Colors.green : colors.error;

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: accent.withValues(alpha: 0.07),
        borderRadius: BorderRadius.circular(18),
        border: Border.all(color: accent.withValues(alpha: 0.25)),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(
            isCorrect ? Icons.check_circle_outline : Icons.info_outline_rounded,
            color: accent,
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Text(
              explanation,
              style: TextStyle(
                color: colors.onSurfaceVariant,
                height: 1.6,
              ),
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
    final colors = Theme.of(context).colorScheme;
    final percent = ((score / total) * 100).round();

    return Scaffold(
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(24),
            child: Column(
              children: [
                Container(
                  width: 92,
                  height: 92,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: passed
                        ? Colors.green.withValues(alpha: 0.12)
                        : colors.errorContainer,
                  ),
                  child: Icon(
                    passed ? Icons.emoji_events_rounded : Icons.refresh_rounded,
                    size: 46,
                    color: passed ? Colors.green : colors.onErrorContainer,
                  ),
                ),
                const SizedBox(height: 22),
                Text(
                  passed
                      ? 'أحسنت، أتقنت الدرس!'
                      : 'محاولة جيدة، راجع ثم أعد الاختبار',
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                        fontWeight: FontWeight.w900,
                      ),
                ),
                const SizedBox(height: 10),
                Text(
                  '$score من $total • $percent%',
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        color: colors.onSurfaceVariant,
                        fontWeight: FontWeight.w800,
                      ),
                ),
                const SizedBox(height: 28),
                SizedBox(
                  width: double.infinity,
                  child: FilledButton(
                    onPressed: passed ? onDone : onRetry,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 15),
                      child: Text(
                        passed ? 'العودة إلى الدرس' : 'أعد المحاولة',
                        style: const TextStyle(fontWeight: FontWeight.w900),
                      ),
                    ),
                  ),
                ),
                if (!passed) ...[
                  const SizedBox(height: 10),
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
