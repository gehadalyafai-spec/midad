import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

import '../../../app/theme/app_theme.dart';
import '../../../services/progress_service.dart';
import '../../lessons/screens/lesson_screen.dart';
import '../../quizzes/data/chapter_exam_builder.dart';
import '../../quizzes/screens/quiz_screen.dart';
import '../models/curriculum_models.dart';

class ChapterScreen extends StatefulWidget {
  const ChapterScreen({super.key, required this.chapter});

  final Chapter chapter;

  @override
  State<ChapterScreen> createState() => _ChapterScreenState();
}

class _ChapterScreenState extends State<ChapterScreen> {
  final ProgressService _progressService = ProgressService();
  Set<String> _completedLessonIds = const <String>{};
  int? _bestExamScore;

  @override
  void initState() {
    super.initState();
    _loadProgress();
  }

  Future<void> _loadProgress() async {
    final completed = await _progressService.getCompletedLessonIds();
    final bestExamScore = await _progressService.getExamBestScore(
      '${widget.chapter.id}-chapter-exam',
    );
    if (!mounted) return;
    setState(() {
      _completedLessonIds = completed;
      _bestExamScore = bestExamScore;
    });
  }

  Future<void> _openLesson(Lesson lesson) async {
    await Navigator.of(context).push(
      MaterialPageRoute<void>(
        builder: (_) => LessonScreen(lesson: lesson),
      ),
    );
    await _loadProgress();
  }

  Future<void> _openChapterExam() async {
    final questions = chapterExamQuestions(widget.chapter);
    if (questions.isEmpty) return;

    final examId = '${widget.chapter.id}-chapter-exam';
    final examLesson = Lesson(
      id: examId,
      title: 'اختبار الفصل: ${widget.chapter.title}',
      subtitle: 'اختبار شامل يراجع أهم أفكار دروس الفصل.',
    );

    await Navigator.of(context).push<bool>(
      MaterialPageRoute<bool>(
        builder: (_) => QuizScreen(
          lesson: examLesson,
          questions: questions,
          markLessonComplete: false,
          examProgressKey: examId,
        ),
      ),
    );
    await _loadProgress();
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final text = isDark ? AppColors.darkTextPrimary : AppColors.textPrimary;
    final muted =
        isDark ? AppColors.darkTextSecondary : AppColors.textSecondary;
    final surface = isDark ? AppColors.darkSurface : const Color(0xFFFFFDF8);

    final available =
        widget.chapter.lessons.where((lesson) => lesson.isAvailable).toList();
    final completed = available
        .where((lesson) => _completedLessonIds.contains(lesson.id))
        .length;
    final progress = available.isEmpty ? 0.0 : completed / available.length;

    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Positioned.fill(
              child: CustomPaint(
                painter: _ChapterDotsPainter(
                  color: isDark
                      ? Colors.white.withValues(alpha: 0.03)
                      : AppColors.primary.withValues(alpha: 0.035),
                ),
              ),
            ),
            ListView(
              padding: const EdgeInsets.fromLTRB(22, 18, 22, 40),
              children: [
                _ChapterTopBar(
                  surface: surface,
                  textColor: text,
                  onBack: () => Navigator.of(context).pop(),
                ).animate().fadeIn(duration: 280.ms),
                const SizedBox(height: 34),
                Text(
                  'مسار الفصل',
                  style: TextStyle(
                    color: AppColors.accent,
                    fontWeight: FontWeight.w900,
                    fontSize: 13,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  widget.chapter.title,
                  style: Theme.of(context).textTheme.displaySmall?.copyWith(
                        color: text,
                        fontWeight: FontWeight.w900,
                        height: 1.05,
                        letterSpacing: -1.2,
                      ),
                )
                    .animate(delay: 60.ms)
                    .fadeIn(duration: 350.ms)
                    .slideY(begin: 0.08, end: 0),
                const SizedBox(height: 10),
                Text(
                  widget.chapter.subtitle,
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        color: muted,
                        height: 1.6,
                      ),
                ),
                const SizedBox(height: 26),
                _ChapterProgressStrip(
                  progress: progress,
                  completed: completed,
                  total: available.length,
                  surface: surface,
                  textColor: text,
                  mutedColor: muted,
                ),
                const SizedBox(height: 34),
                Text(
                  'الدروس',
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(
                        color: text,
                        fontWeight: FontWeight.w900,
                      ),
                ),
                const SizedBox(height: 18),
                ...List.generate(widget.chapter.lessons.length, (index) {
                  final lesson = widget.chapter.lessons[index];
                  final done = _completedLessonIds.contains(lesson.id);
                  final prerequisiteDone = index == 0 ||
                      _completedLessonIds.contains(
                        widget.chapter.lessons[index - 1].id,
                      );
                  final enabled = lesson.isAvailable && prerequisiteDone;

                  return _TimelineLesson(
                    number: index + 1,
                    lesson: lesson,
                    completed: done,
                    isLast: index == widget.chapter.lessons.length - 1,
                    surface: surface,
                    textColor: text,
                    mutedColor: muted,
                    onTap: enabled ? () => _openLesson(lesson) : null,
                  )
                      .animate(delay: (120 + index * 45).ms)
                      .fadeIn(duration: 320.ms)
                      .slideX(begin: 0.04, end: 0);
                }),
                const SizedBox(height: 8),
                _ChapterExamCard(
                  chapterTitle: widget.chapter.title,
                  bestScore: _bestExamScore,
                  completed: completed,
                  total: available.length,
                  surface: surface,
                  textColor: text,
                  mutedColor: muted,
                  onTap: _openChapterExam,
                ).animate(delay: 520.ms).fadeIn(duration: 340.ms),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _ChapterTopBar extends StatelessWidget {
  const _ChapterTopBar({
    required this.surface,
    required this.textColor,
    required this.onBack,
  });

  final Color surface;
  final Color textColor;
  final VoidCallback onBack;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Material(
          color: surface,
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
            color: AppColors.primary.withValues(alpha: 0.10),
            borderRadius: BorderRadius.circular(999),
          ),
          child: const Text(
            'رياضيات • ثاني متوسط',
            style: TextStyle(
              color: AppColors.primary,
              fontWeight: FontWeight.w900,
              fontSize: 11,
            ),
          ),
        ),
      ],
    );
  }
}

class _ChapterProgressStrip extends StatelessWidget {
  const _ChapterProgressStrip({
    required this.progress,
    required this.completed,
    required this.total,
    required this.surface,
    required this.textColor,
    required this.mutedColor,
  });

  final double progress;
  final int completed;
  final int total;
  final Color surface;
  final Color textColor;
  final Color mutedColor;

  @override
  Widget build(BuildContext context) {
    final percent = (progress * 100).round();

    return Container(
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: surface,
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: mutedColor.withValues(alpha: 0.13)),
      ),
      child: Row(
        children: [
          Container(
            width: 58,
            height: 58,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: AppColors.secondary,
              borderRadius: BorderRadius.circular(18),
            ),
            child: Text(
              '$percent%',
              style: const TextStyle(
                color: AppColors.primaryDark,
                fontWeight: FontWeight.w900,
              ),
            ),
          ),
          const SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '$completed من $total مكتمل',
                  style: TextStyle(
                    color: textColor,
                    fontWeight: FontWeight.w900,
                  ),
                ),
                const SizedBox(height: 8),
                ClipRRect(
                  borderRadius: BorderRadius.circular(99),
                  child: LinearProgressIndicator(
                    value: progress,
                    minHeight: 7,
                    backgroundColor: mutedColor.withValues(alpha: 0.12),
                    valueColor: const AlwaysStoppedAnimation<Color>(
                      AppColors.primary,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _TimelineLesson extends StatelessWidget {
  const _TimelineLesson({
    required this.number,
    required this.lesson,
    required this.completed,
    required this.isLast,
    required this.surface,
    required this.textColor,
    required this.mutedColor,
    required this.onTap,
  });

  final int number;
  final Lesson lesson;
  final bool completed;
  final bool isLast;
  final Color surface;
  final Color textColor;
  final Color mutedColor;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final enabled = onTap != null;
    final accent = completed
        ? AppColors.primary
        : enabled
            ? AppColors.secondary
            : mutedColor.withValues(alpha: 0.35);

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: 58,
          child: Column(
            children: [
              Container(
                width: 42,
                height: 42,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: completed
                      ? AppColors.primary
                      : enabled
                          ? AppColors.secondary
                          : surface,
                  borderRadius: BorderRadius.circular(15),
                  border: Border.all(color: accent),
                ),
                child: completed
                    ? const Icon(
                        Icons.check_rounded,
                        color: Colors.white,
                        size: 20,
                      )
                    : enabled
                        ? Text(
                            '$number',
                            style: const TextStyle(
                              color: AppColors.primaryDark,
                              fontWeight: FontWeight.w900,
                            ),
                          )
                        : Icon(
                            Icons.lock_outline_rounded,
                            size: 18,
                            color: mutedColor,
                          ),
              ),
              if (!isLast)
                Container(
                  width: 2,
                  height: 82,
                  margin: const EdgeInsets.symmetric(vertical: 6),
                  color: accent.withValues(alpha: 0.35),
                ),
            ],
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(bottom: 22),
            child: Material(
              color: Colors.transparent,
              child: InkWell(
                onTap: onTap,
                borderRadius: BorderRadius.circular(24),
                child: Container(
                  padding: const EdgeInsets.all(18),
                  decoration: BoxDecoration(
                    color: enabled ? surface : surface.withValues(alpha: 0.55),
                    borderRadius: BorderRadius.circular(24),
                    border: Border.all(
                      color: completed
                          ? AppColors.primary.withValues(alpha: 0.28)
                          : mutedColor.withValues(alpha: 0.12),
                    ),
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              lesson.title,
                              style: TextStyle(
                                color: enabled ? textColor : mutedColor,
                                fontWeight: FontWeight.w900,
                                fontSize: 15,
                              ),
                            ),
                            const SizedBox(height: 6),
                            Text(
                              completed
                                  ? 'تم إكمال الدرس'
                                  : enabled
                                      ? lesson.subtitle
                                      : 'سيُفتح لاحقًا',
                              style: TextStyle(
                                color: completed
                                    ? AppColors.primary
                                    : mutedColor,
                                height: 1.45,
                                fontSize: 12,
                              ),
                            ),
                          ],
                        ),
                      ),
                      if (enabled)
                        Icon(
                          Icons.arrow_back_rounded,
                          color: completed ? AppColors.primary : mutedColor,
                        ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class _ChapterExamCard extends StatelessWidget {
  const _ChapterExamCard({
    required this.chapterTitle,
    this.bestScore,
    required this.completed,
    required this.total,
    required this.surface,
    required this.textColor,
    required this.mutedColor,
    required this.onTap,
  });

  final String chapterTitle;
  final int? bestScore;
  final int completed;
  final int total;
  final Color surface;
  final Color textColor;
  final Color mutedColor;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final allLessonsDone = total > 0 && completed == total;

    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(26),
        child: Container(
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: AppColors.primaryDark,
            borderRadius: BorderRadius.circular(26),
          ),
          child: Row(
            children: [
              Container(
                width: 54,
                height: 54,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: AppColors.secondary,
                  borderRadius: BorderRadius.circular(18),
                ),
                child: const Icon(
                  Icons.workspace_premium_rounded,
                  color: AppColors.primaryDark,
                  size: 28,
                ),
              ),
              const SizedBox(width: 14),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'اختبار الفصل',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w900,
                        fontSize: 17,
                      ),
                    ),
                    const SizedBox(height: 5),
                    Text(
                      '10 أسئلة موزعة على دروس $chapterTitle',
                      style: const TextStyle(
                        color: Colors.white70,
                        height: 1.45,
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 7),
                    Text(
                      allLessonsDone
                          ? 'أكملت الدروس • وقت المراجعة الشاملة'
                          : 'يمكنك تجربته الآن، والأفضل بعد إكمال دروس الفصل',
                      style: TextStyle(
                        color: allLessonsDone
                            ? AppColors.secondary
                            : Colors.white60,
                        fontSize: 10,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                    if (bestScore != null) ...[
                      const SizedBox(height: 8),
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 10,
                          vertical: 6,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.white.withValues(alpha: 0.10),
                          borderRadius: BorderRadius.circular(999),
                        ),
                        child: Text(
                          'أفضل نتيجة: $bestScore%',
                          style: const TextStyle(
                            color: AppColors.secondary,
                            fontSize: 10,
                            fontWeight: FontWeight.w900,
                          ),
                        ),
                      ),
                    ],
                  ],
                ),
              ),
              const Icon(
                Icons.arrow_back_rounded,
                color: Colors.white70,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _ChapterDotsPainter extends CustomPainter {
  const _ChapterDotsPainter({required this.color});

  final Color color;

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()..color = color;
    const gap = 28.0;
    for (double y = 10; y < size.height; y += gap) {
      for (double x = 10; x < size.width; x += gap) {
        canvas.drawCircle(Offset(x, y), 1.0, paint);
      }
    }
  }

  @override
  bool shouldRepaint(covariant _ChapterDotsPainter oldDelegate) {
    return oldDelegate.color != color;
  }
}
