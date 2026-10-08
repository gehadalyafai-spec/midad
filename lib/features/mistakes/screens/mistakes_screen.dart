import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

import '../../../app/theme/app_theme.dart';
import '../../../services/progress_service.dart';
import '../../curriculum/models/curriculum_models.dart';
import '../../quizzes/models/quiz_question.dart';
import '../../quizzes/screens/quiz_screen.dart';

class MistakesScreen extends StatefulWidget {
  const MistakesScreen({
    super.key,
    required this.lesson,
    required this.allQuestions,
  });

  final Lesson lesson;
  final List<QuizQuestion> allQuestions;

  @override
  State<MistakesScreen> createState() => _MistakesScreenState();
}

class _MistakesScreenState extends State<MistakesScreen> {
  final ProgressService _progressService = ProgressService();

  bool _loading = true;
  List<QuizQuestion> _mistakes = const <QuizQuestion>[];

  @override
  void initState() {
    super.initState();
    _loadMistakes();
  }

  Future<void> _loadMistakes() async {
    final ids = await _progressService.getMistakeQuestionIds();
    final mistakes = widget.allQuestions
        .where((question) => ids.contains(question.id))
        .toList();

    if (!mounted) return;
    setState(() {
      _mistakes = mistakes;
      _loading = false;
    });
  }

  Future<void> _reviewMistakes() async {
    if (_mistakes.isEmpty) return;

    await Navigator.of(context).push<bool>(
      MaterialPageRoute<bool>(
        builder: (_) => QuizScreen(
          lesson: widget.lesson,
          questions: _mistakes,
          markLessonComplete: false,
        ),
      ),
    );

    await _loadMistakes();
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final text = isDark ? AppColors.darkTextPrimary : AppColors.textPrimary;
    final muted =
        isDark ? AppColors.darkTextSecondary : AppColors.textSecondary;
    final paper = isDark ? AppColors.darkSurface : const Color(0xFFFFFDF8);

    return Scaffold(
      body: SafeArea(
        child: _loading
            ? const Center(child: CircularProgressIndicator())
            : Stack(
                children: [
                  Positioned.fill(
                    child: CustomPaint(
                      painter: _CorrectionPaperPainter(
                        lineColor: isDark
                            ? Colors.white.withValues(alpha: 0.03)
                            : AppColors.accent.withValues(alpha: 0.04),
                      ),
                    ),
                  ),
                  if (_mistakes.isEmpty)
                    _EmptyMistakes(
                      paper: paper,
                      textColor: text,
                      mutedColor: muted,
                      onBack: () => Navigator.of(context).pop(),
                    )
                  else
                    ListView(
                      padding: const EdgeInsets.fromLTRB(22, 18, 22, 120),
                      children: [
                        _MistakesTopBar(
                          paper: paper,
                          textColor: text,
                          onBack: () => Navigator.of(context).pop(),
                        ),
                        const SizedBox(height: 34),
                        const Text(
                          'دفتر التصحيح',
                          style: TextStyle(
                            color: AppColors.accent,
                            fontWeight: FontWeight.w900,
                            fontSize: 13,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          'راجع أخطاءك\nوحوّلها إلى نقاط قوة',
                          style: Theme.of(context)
                              .textTheme
                              .headlineMedium
                              ?.copyWith(
                                color: text,
                                fontWeight: FontWeight.w900,
                                height: 1.15,
                                letterSpacing: -0.7,
                              ),
                        )
                            .animate()
                            .fadeIn(duration: 350.ms)
                            .slideY(begin: 0.08, end: 0),
                        const SizedBox(height: 12),
                        Text(
                          'لديك ${_mistakes.length} أسئلة تحتاج مراجعة.',
                          style: TextStyle(
                            color: muted,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        const SizedBox(height: 28),
                        ...List.generate(_mistakes.length, (index) {
                          final question = _mistakes[index];
                          return _CorrectionNote(
                            number: index + 1,
                            question: question,
                            paper: paper,
                            textColor: text,
                            mutedColor: muted,
                          )
                              .animate(delay: (80 + index * 55).ms)
                              .fadeIn(duration: 300.ms)
                              .slideX(begin: 0.04, end: 0);
                        }),
                      ],
                    ),
                  if (_mistakes.isNotEmpty)
                    Positioned(
                      left: 22,
                      right: 22,
                      bottom: 18,
                      child: FilledButton.icon(
                        onPressed: _reviewMistakes,
                        style: FilledButton.styleFrom(
                          backgroundColor: AppColors.accent,
                          foregroundColor: Colors.white,
                          minimumSize: const Size.fromHeight(58),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                        icon: const Icon(Icons.replay_rounded),
                        label: const Text(
                          'اختبرني في أخطائي',
                          style: TextStyle(fontWeight: FontWeight.w900),
                        ),
                      ),
                    ),
                ],
              ),
      ),
    );
  }
}

class _MistakesTopBar extends StatelessWidget {
  const _MistakesTopBar({
    required this.paper,
    required this.textColor,
    required this.onBack,
  });

  final Color paper;
  final Color textColor;
  final VoidCallback onBack;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Material(
          color: paper,
          borderRadius: BorderRadius.circular(14),
          child: InkWell(
            onTap: onBack,
            borderRadius: BorderRadius.circular(14),
            child: SizedBox(
              width: 46,
              height: 46,
              child: Icon(
                Icons.arrow_forward_rounded,
                color: textColor,
              ),
            ),
          ),
        ),
        const Spacer(),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
          decoration: BoxDecoration(
            color: AppColors.accent.withValues(alpha: 0.11),
            borderRadius: BorderRadius.circular(999),
          ),
          child: const Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                Icons.auto_fix_high_rounded,
                size: 16,
                color: AppColors.accent,
              ),
              SizedBox(width: 5),
              Text(
                'مراجعة ذكية',
                style: TextStyle(
                  color: AppColors.accent,
                  fontWeight: FontWeight.w900,
                  fontSize: 11,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _CorrectionNote extends StatelessWidget {
  const _CorrectionNote({
    required this.number,
    required this.question,
    required this.paper,
    required this.textColor,
    required this.mutedColor,
  });

  final int number;
  final QuizQuestion question;
  final Color paper;
  final Color textColor;
  final Color mutedColor;

  @override
  Widget build(BuildContext context) {
    final tilt = number.isOdd ? -0.008 : 0.008;

    return Transform.rotate(
      angle: tilt,
      child: Container(
        margin: const EdgeInsets.only(bottom: 18),
        padding: const EdgeInsets.fromLTRB(20, 18, 20, 20),
        decoration: BoxDecoration(
          color: paper,
          borderRadius: BorderRadius.circular(24),
          border: Border.all(
            color: AppColors.accent.withValues(alpha: 0.18),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.035),
              blurRadius: 18,
              offset: const Offset(0, 8),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  width: 38,
                  height: 38,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: AppColors.accent,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Text(
                    number.toString(),
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                const Text(
                  'راجع هذه النقطة',
                  style: TextStyle(
                    color: AppColors.accent,
                    fontWeight: FontWeight.w900,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            Text(
              question.question,
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    color: textColor,
                    fontWeight: FontWeight.w900,
                    height: 1.45,
                  ),
            ),
            const SizedBox(height: 14),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(15),
              decoration: BoxDecoration(
                color: AppColors.secondary.withValues(alpha: 0.18),
                borderRadius: BorderRadius.circular(18),
              ),
              child: Text(
                question.explanation,
                style: TextStyle(
                  color: mutedColor,
                  height: 1.65,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _EmptyMistakes extends StatelessWidget {
  const _EmptyMistakes({
    required this.paper,
    required this.textColor,
    required this.mutedColor,
    required this.onBack,
  });

  final Color paper;
  final Color textColor;
  final Color mutedColor;
  final VoidCallback onBack;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(22, 18, 22, 32),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _MistakesTopBar(
            paper: paper,
            textColor: textColor,
            onBack: onBack,
          ),
          const Spacer(),
          Center(
            child: Column(
              children: [
                Container(
                  width: 118,
                  height: 118,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: AppColors.secondary,
                    borderRadius: BorderRadius.circular(38),
                  ),
                  child: const Icon(
                    Icons.auto_awesome_rounded,
                    size: 48,
                    color: AppColors.primaryDark,
                  ),
                ),
                const SizedBox(height: 24),
                Text(
                  'صفحة نظيفة 👏',
                  style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                        color: textColor,
                        fontWeight: FontWeight.w900,
                      ),
                ),
                const SizedBox(height: 10),
                Text(
                  'لا توجد أخطاء تحتاج مراجعة الآن.',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: mutedColor,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ],
            ),
          ),
          const Spacer(),
        ],
      ),
    );
  }
}

class _CorrectionPaperPainter extends CustomPainter {
  const _CorrectionPaperPainter({required this.lineColor});

  final Color lineColor;

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = lineColor
      ..strokeWidth = 1;

    const gap = 38.0;
    for (double y = 18; y < size.height; y += gap) {
      canvas.drawLine(
        Offset(0, y),
        Offset(size.width, y),
        paint,
      );
    }
  }

  @override
  bool shouldRepaint(covariant _CorrectionPaperPainter oldDelegate) {
    return oldDelegate.lineColor != lineColor;
  }
}
