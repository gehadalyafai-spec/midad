import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

import '../../../app/theme/app_theme.dart';
import '../../../services/progress_service.dart';
import '../../curriculum/models/curriculum_models.dart';
import '../../quizzes/data/rational_numbers_quiz.dart';
import '../../quizzes/screens/quiz_screen.dart';

class LessonScreen extends StatefulWidget {
  const LessonScreen({super.key, required this.lesson});

  final Lesson lesson;

  @override
  State<LessonScreen> createState() => _LessonScreenState();
}

class _LessonScreenState extends State<LessonScreen> {
  final ProgressService _progressService = ProgressService();
  bool _isCompleted = false;

  @override
  void initState() {
    super.initState();
    _loadLessonState();
  }

  Future<void> _loadLessonState() async {
    await _progressService.markLessonStarted(widget.lesson);
    final completed = await _progressService.getCompletedLessonIds();

    if (!mounted) return;
    setState(() => _isCompleted = completed.contains(widget.lesson.id));
  }

  Future<void> _openQuiz() async {
    if (widget.lesson.id != 'rational-numbers-intro') {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('اختبار هذا الدرس سيُضاف قريبًا.')),
      );
      return;
    }

    final passed = await Navigator.of(context).push<bool>(
      MaterialPageRoute<bool>(
        builder: (_) => QuizScreen(
          lesson: widget.lesson,
          questions: rationalNumbersIntroQuiz,
        ),
      ),
    );

    if (passed == true && mounted) {
      setState(() => _isCompleted = true);
    }
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
        child: Stack(
          children: [
            Positioned.fill(
              child: CustomPaint(
                painter: _NotebookLinesPainter(
                  lineColor: isDark
                      ? Colors.white.withValues(alpha: 0.035)
                      : AppColors.primary.withValues(alpha: 0.045),
                  marginColor: AppColors.accent.withValues(alpha: 0.13),
                ),
              ),
            ),
            ListView(
              padding: const EdgeInsets.fromLTRB(22, 18, 22, 120),
              children: [
                Row(
                  children: [
                    _RoundBackButton(
                      paper: paper,
                      color: text,
                      onTap: () => Navigator.of(context).pop(),
                    ),
                    const Spacer(),
                    if (_isCompleted)
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 12,
                          vertical: 8,
                        ),
                        decoration: BoxDecoration(
                          color: AppColors.primary,
                          borderRadius: BorderRadius.circular(999),
                        ),
                        child: const Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(
                              Icons.check_rounded,
                              size: 16,
                              color: Colors.white,
                            ),
                            SizedBox(width: 5),
                            Text(
                              'مكتمل',
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w900,
                                fontSize: 11,
                              ),
                            ),
                          ],
                        ),
                      ),
                  ],
                ),
                const SizedBox(height: 32),
                Text(
                  'درس اليوم',
                  style: const TextStyle(
                    color: AppColors.accent,
                    fontWeight: FontWeight.w900,
                    fontSize: 13,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  widget.lesson.title,
                  style: Theme.of(context).textTheme.displaySmall?.copyWith(
                        color: text,
                        fontWeight: FontWeight.w900,
                        height: 1.04,
                        letterSpacing: -1.1,
                      ),
                )
                    .animate()
                    .fadeIn(duration: 350.ms)
                    .slideY(begin: 0.08, end: 0),
                const SizedBox(height: 10),
                Text(
                  widget.lesson.subtitle,
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        color: muted,
                        height: 1.6,
                      ),
                ),
                const SizedBox(height: 30),
                const _ConceptBoard()
                    .animate(delay: 80.ms)
                    .fadeIn(duration: 360.ms),
                const SizedBox(height: 30),
                _LessonSection(
                  number: '01',
                  title: 'الفكرة الأساسية',
                  text:
                      'العدد النسبي هو أي عدد يمكن كتابته على صورة أ/ب، حيث أ و ب عددان صحيحان، وب لا يساوي صفرًا.',
                  accent: AppColors.primary,
                  textColor: text,
                  mutedColor: muted,
                ).animate(delay: 120.ms).fadeIn(),
                const SizedBox(height: 26),
                _LessonSection(
                  number: '02',
                  title: 'كيف أفهمها؟',
                  text:
                      'تشمل الأعداد النسبية الكسور والأعداد الصحيحة وبعض الأعداد العشرية. مثال: 3/4 عدد نسبي، وكذلك -2 لأنه يمكن كتابته على الصورة -2/1.',
                  accent: AppColors.secondary,
                  textColor: text,
                  mutedColor: muted,
                ).animate(delay: 170.ms).fadeIn(),
                const SizedBox(height: 26),
                const _WorkedExample()
                    .animate(delay: 210.ms)
                    .fadeIn(),
                const SizedBox(height: 18),
                _WarningNote(
                  textColor: text,
                  mutedColor: muted,
                ).animate(delay: 250.ms).fadeIn(),
                if (_isCompleted) ...[
                  const SizedBox(height: 18),
                  _CompletedNote(
                    paper: paper,
                    textColor: text,
                  ),
                ],
              ],
            ),
            Positioned(
              left: 22,
              right: 22,
              bottom: 18,
              child: _LessonActionBar(
                completed: _isCompleted,
                onQuiz: _openQuiz,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _RoundBackButton extends StatelessWidget {
  const _RoundBackButton({
    required this.paper,
    required this.color,
    required this.onTap,
  });

  final Color paper;
  final Color color;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: paper,
      borderRadius: BorderRadius.circular(14),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(14),
        child: SizedBox(
          width: 46,
          height: 46,
          child: Icon(Icons.arrow_forward_rounded, color: color),
        ),
      ),
    );
  }
}

class _ConceptBoard extends StatelessWidget {
  const _ConceptBoard();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(22),
      decoration: BoxDecoration(
        color: AppColors.primaryDark,
        borderRadius: BorderRadius.circular(30),
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'الشكل العام',
                  style: TextStyle(
                    color: Colors.white60,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const SizedBox(height: 10),
                const Text(
                  'أ / ب',
                  textDirection: TextDirection.rtl,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 42,
                    fontWeight: FontWeight.w900,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  'ب ≠ 0',
                  style: TextStyle(
                    color: AppColors.secondary,
                    fontSize: 18,
                    fontWeight: FontWeight.w900,
                  ),
                ),
              ],
            ),
          ),
          Container(
            width: 92,
            height: 92,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: AppColors.secondary,
              borderRadius: BorderRadius.circular(28),
            ),
            child: const Icon(
              Icons.functions_rounded,
              color: AppColors.primaryDark,
              size: 42,
            ),
          ),
        ],
      ),
    );
  }
}

class _LessonSection extends StatelessWidget {
  const _LessonSection({
    required this.number,
    required this.title,
    required this.text,
    required this.accent,
    required this.textColor,
    required this.mutedColor,
  });

  final String number;
  final String title;
  final String text;
  final Color accent;
  final Color textColor;
  final Color mutedColor;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          number,
          style: TextStyle(
            color: accent,
            fontWeight: FontWeight.w900,
            fontSize: 13,
          ),
        ),
        const SizedBox(width: 14),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      color: textColor,
                      fontWeight: FontWeight.w900,
                    ),
              ),
              const SizedBox(height: 8),
              Text(
                text,
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      color: mutedColor,
                      height: 1.75,
                    ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _WorkedExample extends StatelessWidget {
  const _WorkedExample();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(22),
      decoration: BoxDecoration(
        color: AppColors.secondary,
        borderRadius: BorderRadius.circular(28),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Row(
            children: [
              Icon(
                Icons.auto_awesome_rounded,
                color: AppColors.primaryDark,
              ),
              SizedBox(width: 8),
              Text(
                'مثال محلول',
                style: TextStyle(
                  color: AppColors.primaryDark,
                  fontWeight: FontWeight.w900,
                  fontSize: 17,
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          const Text(
            '-5 = -5/1',
            textDirection: TextDirection.ltr,
            style: TextStyle(
              color: AppColors.primaryDark,
              fontWeight: FontWeight.w900,
              fontSize: 28,
            ),
          ),
          const SizedBox(height: 10),
          Text(
            'إذن -5 عدد نسبي، لأننا كتبناه على صورة كسر مقامه لا يساوي صفرًا. وكذلك 0.75 = 3/4.',
            style: const TextStyle(
              color: AppColors.primaryDark,
              height: 1.65,
              fontWeight: FontWeight.w700,
            ),
          ),
        ],
      ),
    );
  }
}

class _WarningNote extends StatelessWidget {
  const _WarningNote({
    required this.textColor,
    required this.mutedColor,
  });

  final Color textColor;
  final Color mutedColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: AppColors.accent.withValues(alpha: 0.11),
        borderRadius: BorderRadius.circular(22),
        border: Border.all(
          color: AppColors.accent.withValues(alpha: 0.28),
        ),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Icon(
            Icons.error_outline_rounded,
            color: AppColors.accent,
          ),
          const SizedBox(width: 12),
          Expanded(
            child: RichText(
              text: TextSpan(
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: mutedColor,
                      height: 1.65,
                    ),
                children: [
                  TextSpan(
                    text: 'انتبه: ',
                    style: TextStyle(
                      color: textColor,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                  const TextSpan(
                    text:
                        'لا يمكن أن يكون مقام الكسر صفرًا؛ لذلك أي تعبير على صورة أ/0 غير معرّف.',
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _CompletedNote extends StatelessWidget {
  const _CompletedNote({
    required this.paper,
    required this.textColor,
  });

  final Color paper;
  final Color textColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: paper,
        borderRadius: BorderRadius.circular(22),
        border: Border.all(
          color: AppColors.primary.withValues(alpha: 0.25),
        ),
      ),
      child: Row(
        children: [
          const Icon(
            Icons.verified_rounded,
            color: AppColors.primary,
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Text(
              'أكملت هذا الدرس بنجاح. يمكنك إعادة الاختبار وقتما تريد.',
              style: TextStyle(
                color: textColor,
                fontWeight: FontWeight.w800,
                height: 1.5,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _LessonActionBar extends StatelessWidget {
  const _LessonActionBar({
    required this.completed,
    required this.onQuiz,
  });

  final bool completed;
  final VoidCallback onQuiz;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 68,
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: AppColors.primaryDark,
        borderRadius: BorderRadius.circular(22),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.16),
            blurRadius: 24,
            offset: const Offset(0, 12),
          ),
        ],
      ),
      child: Row(
        children: [
          Expanded(
            child: Text(
              completed ? 'أتقنت الدرس' : 'جاهز للاختبار؟',
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w900,
              ),
            ),
          ),
          FilledButton.icon(
            onPressed: onQuiz,
            style: FilledButton.styleFrom(
              backgroundColor: AppColors.secondary,
              foregroundColor: AppColors.primaryDark,
            ),
            icon: Icon(
              completed ? Icons.replay_rounded : Icons.bolt_rounded,
            ),
            label: Text(
              completed ? 'أعد الاختبار' : 'ابدأ',
              style: const TextStyle(fontWeight: FontWeight.w900),
            ),
          ),
        ],
      ),
    );
  }
}

class _NotebookLinesPainter extends CustomPainter {
  const _NotebookLinesPainter({
    required this.lineColor,
    required this.marginColor,
  });

  final Color lineColor;
  final Color marginColor;

  @override
  void paint(Canvas canvas, Size size) {
    final linePaint = Paint()
      ..color = lineColor
      ..strokeWidth = 1;
    final marginPaint = Paint()
      ..color = marginColor
      ..strokeWidth = 1.5;

    const gap = 34.0;
    for (double y = 86; y < size.height; y += gap) {
      canvas.drawLine(Offset(0, y), Offset(size.width, y), linePaint);
    }

    canvas.drawLine(
      Offset(size.width - 34, 0),
      Offset(size.width - 34, size.height),
      marginPaint,
    );
  }

  @override
  bool shouldRepaint(covariant _NotebookLinesPainter oldDelegate) {
    return oldDelegate.lineColor != lineColor ||
        oldDelegate.marginColor != marginColor;
  }
}
