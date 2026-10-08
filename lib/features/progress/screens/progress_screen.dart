import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

import '../../../app/theme/app_theme.dart';
import '../../../services/progress_service.dart';
import '../../curriculum/data/grade2_math_data.dart';
import '../../curriculum/models/curriculum_models.dart';

class ProgressScreen extends StatefulWidget {
  const ProgressScreen({super.key});

  @override
  State<ProgressScreen> createState() => _ProgressScreenState();
}

class _ProgressScreenState extends State<ProgressScreen> {
  final ProgressService _progressService = ProgressService();

  bool _loading = true;
  Set<String> _completed = const <String>{};
  Set<String> _mistakes = const <String>{};

  @override
  void initState() {
    super.initState();
    _load();
  }

  Future<void> _load() async {
    final completed = await _progressService.getCompletedLessonIds();
    final mistakes = await _progressService.getMistakeQuestionIds();

    if (!mounted) return;
    setState(() {
      _completed = completed;
      _mistakes = mistakes;
      _loading = false;
    });
  }

  bool _chapterComplete(Chapter chapter) {
    final lessons = chapter.lessons.where((lesson) => lesson.isAvailable);
    return lessons.isNotEmpty &&
        lessons.every((lesson) => _completed.contains(lesson.id));
  }

  bool _chapterUnlocked(int index) {
    if (index == 0) return true;
    return _chapterComplete(grade2MathChapters[index - 1]);
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final text = isDark ? AppColors.darkTextPrimary : AppColors.textPrimary;
    final muted =
        isDark ? AppColors.darkTextSecondary : AppColors.textSecondary;
    final surface = isDark ? AppColors.darkSurface : const Color(0xFFFFFDF8);

    final allLessons = grade2MathChapters
        .expand((chapter) => chapter.lessons)
        .where((lesson) => lesson.isAvailable)
        .toList();

    final completedLessons =
        allLessons.where((lesson) => _completed.contains(lesson.id)).length;

    final totalLessons = allLessons.length;
    final completedChapters = grade2MathChapters
        .where((chapter) => _chapterComplete(chapter))
        .length;

    final overallProgress =
        totalLessons == 0 ? 0.0 : completedLessons / totalLessons;
    final percent = (overallProgress * 100).round();

    return Scaffold(
      body: SafeArea(
        child: _loading
            ? const Center(child: CircularProgressIndicator())
            : Stack(
                children: [
                  Positioned.fill(
                    child: CustomPaint(
                      painter: _ProgressGridPainter(
                        color: isDark
                            ? Colors.white.withValues(alpha: 0.025)
                            : AppColors.primary.withValues(alpha: 0.035),
                      ),
                    ),
                  ),
                  ListView(
                    padding: const EdgeInsets.fromLTRB(22, 18, 22, 42),
                    children: [
                      Row(
                        children: [
                          Material(
                            color: surface,
                            borderRadius: BorderRadius.circular(14),
                            child: InkWell(
                              onTap: () => Navigator.of(context).pop(),
                              borderRadius: BorderRadius.circular(14),
                              child: SizedBox(
                                width: 46,
                                height: 46,
                                child: Icon(
                                  Icons.arrow_forward_rounded,
                                  color: text,
                                ),
                              ),
                            ),
                          ),
                          const Spacer(),
                          const Text(
                            'لوحة الإتقان',
                            style: TextStyle(
                              color: AppColors.primary,
                              fontWeight: FontWeight.w900,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 30),
                      _MasteryHero(
                        percent: percent,
                        completedLessons: completedLessons,
                        totalLessons: totalLessons,
                      )
                          .animate()
                          .fadeIn(duration: 350.ms)
                          .slideY(begin: 0.06, end: 0),
                      const SizedBox(height: 14),
                      Row(
                        children: [
                          Expanded(
                            child: _MiniMetric(
                              label: 'فصول مكتملة',
                              value: '$completedChapters/${grade2MathChapters.length}',
                              icon: Icons.flag_rounded,
                              accent: AppColors.secondary,
                              surface: surface,
                              textColor: text,
                              mutedColor: muted,
                            ),
                          ),
                          const SizedBox(width: 12),
                          Expanded(
                            child: _MiniMetric(
                              label: 'أسئلة للمراجعة',
                              value: _mistakes.length.toString(),
                              icon: Icons.refresh_rounded,
                              accent: AppColors.accent,
                              surface: surface,
                              textColor: text,
                              mutedColor: muted,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 30),
                      Text(
                        'رحلة المادة',
                        style: Theme.of(context).textTheme.titleLarge?.copyWith(
                              color: text,
                              fontWeight: FontWeight.w900,
                            ),
                      ),
                      const SizedBox(height: 7),
                      Text(
                        'كل فصل يفتح بعد إكمال الفصل السابق.',
                        style: TextStyle(
                          color: muted,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(height: 22),
                      ...List.generate(grade2MathChapters.length, (index) {
                        final chapter = grade2MathChapters[index];
                        final unlocked = _chapterUnlocked(index);
                        final complete = _chapterComplete(chapter);
                        final lessons = chapter.lessons
                            .where((lesson) => lesson.isAvailable)
                            .toList();
                        final completed = lessons
                            .where((lesson) => _completed.contains(lesson.id))
                            .length;
                        final progress =
                            lessons.isEmpty ? 0.0 : completed / lessons.length;

                        return _ChapterMilestone(
                          index: index,
                          chapter: chapter,
                          unlocked: unlocked,
                          complete: complete,
                          progress: progress,
                          completed: completed,
                          total: lessons.length,
                          isLast: index == grade2MathChapters.length - 1,
                          textColor: text,
                          mutedColor: muted,
                          surface: surface,
                        )
                            .animate(delay: (80 + index * 60).ms)
                            .fadeIn(duration: 320.ms)
                            .slideX(begin: 0.04, end: 0);
                      }),
                    ],
                  ),
                ],
              ),
      ),
    );
  }
}

class _MasteryHero extends StatelessWidget {
  const _MasteryHero({
    required this.percent,
    required this.completedLessons,
    required this.totalLessons,
  });

  final int percent;
  final int completedLessons;
  final int totalLessons;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: AppColors.primaryDark,
        borderRadius: BorderRadius.circular(34),
      ),
      child: Row(
        children: [
          SizedBox(
            width: 112,
            height: 112,
            child: Stack(
              alignment: Alignment.center,
              children: [
                CircularProgressIndicator(
                  value: totalLessons == 0
                      ? 0
                      : completedLessons / totalLessons,
                  strokeWidth: 11,
                  backgroundColor: Colors.white12,
                  valueColor: const AlwaysStoppedAnimation<Color>(
                    AppColors.secondary,
                  ),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      '$percent%',
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 25,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                    const Text(
                      'إتقان',
                      style: TextStyle(
                        color: Colors.white60,
                        fontSize: 10,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(width: 20),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'تقدمك في الرياضيات',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 21,
                    fontWeight: FontWeight.w900,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  '$completedLessons من $totalLessons درسًا مكتملًا',
                  style: const TextStyle(
                    color: Colors.white70,
                    height: 1.5,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const SizedBox(height: 12),
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                  decoration: BoxDecoration(
                    color: Colors.white.withValues(alpha: 0.10),
                    borderRadius: BorderRadius.circular(999),
                  ),
                  child: const Text(
                    'ثاني متوسط',
                    style: TextStyle(
                      color: AppColors.secondary,
                      fontWeight: FontWeight.w900,
                      fontSize: 11,
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

class _MiniMetric extends StatelessWidget {
  const _MiniMetric({
    required this.label,
    required this.value,
    required this.icon,
    required this.accent,
    required this.surface,
    required this.textColor,
    required this.mutedColor,
  });

  final String label;
  final String value;
  final IconData icon;
  final Color accent;
  final Color surface;
  final Color textColor;
  final Color mutedColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 126,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: surface,
        borderRadius: BorderRadius.circular(24),
        border: Border.all(
          color: mutedColor.withValues(alpha: 0.12),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, color: accent),
          const Spacer(),
          Text(
            value,
            style: TextStyle(
              color: textColor,
              fontSize: 23,
              fontWeight: FontWeight.w900,
            ),
          ),
          Text(
            label,
            style: TextStyle(
              color: mutedColor,
              fontSize: 11,
              fontWeight: FontWeight.w700,
            ),
          ),
        ],
      ),
    );
  }
}

class _ChapterMilestone extends StatelessWidget {
  const _ChapterMilestone({
    required this.index,
    required this.chapter,
    required this.unlocked,
    required this.complete,
    required this.progress,
    required this.completed,
    required this.total,
    required this.isLast,
    required this.textColor,
    required this.mutedColor,
    required this.surface,
  });

  final int index;
  final Chapter chapter;
  final bool unlocked;
  final bool complete;
  final double progress;
  final int completed;
  final int total;
  final bool isLast;
  final Color textColor;
  final Color mutedColor;
  final Color surface;

  @override
  Widget build(BuildContext context) {
    final accent = complete
        ? AppColors.primary
        : unlocked
            ? AppColors.secondary
            : mutedColor.withValues(alpha: 0.35);

    final status = complete
        ? 'مكتمل'
        : unlocked
            ? '$completed من $total دروس'
            : 'مقفول';

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: 58,
          child: Column(
            children: [
              Container(
                width: 44,
                height: 44,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: complete
                      ? AppColors.primary
                      : unlocked
                          ? AppColors.secondary
                          : surface,
                  borderRadius: BorderRadius.circular(15),
                  border: Border.all(color: accent),
                ),
                child: complete
                    ? const Icon(
                        Icons.check_rounded,
                        color: Colors.white,
                      )
                    : unlocked
                        ? Text(
                            '${index + 1}',
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
                  height: 88,
                  margin: const EdgeInsets.symmetric(vertical: 5),
                  color: accent.withValues(alpha: 0.28),
                ),
            ],
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: Container(
            margin: const EdgeInsets.only(bottom: 18),
            padding: const EdgeInsets.all(18),
            decoration: BoxDecoration(
              color: surface,
              borderRadius: BorderRadius.circular(24),
              border: Border.all(
                color: accent.withValues(alpha: 0.20),
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  chapter.title,
                  style: TextStyle(
                    color: unlocked ? textColor : mutedColor,
                    fontWeight: FontWeight.w900,
                    height: 1.35,
                  ),
                ),
                const SizedBox(height: 7),
                Row(
                  children: [
                    Text(
                      status,
                      style: TextStyle(
                        color: complete ? AppColors.primary : mutedColor,
                        fontSize: 11,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                    const Spacer(),
                    if (unlocked)
                      Text(
                        '${(progress * 100).round()}%',
                        style: TextStyle(
                          color: complete ? AppColors.primary : mutedColor,
                          fontSize: 11,
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                  ],
                ),
                if (unlocked) ...[
                  const SizedBox(height: 10),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(99),
                    child: LinearProgressIndicator(
                      value: progress,
                      minHeight: 6,
                      backgroundColor: mutedColor.withValues(alpha: 0.10),
                      valueColor: AlwaysStoppedAnimation<Color>(accent),
                    ),
                  ),
                ],
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class _ProgressGridPainter extends CustomPainter {
  const _ProgressGridPainter({required this.color});

  final Color color;

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..strokeWidth = 1;

    const gap = 30.0;

    for (double y = 0; y < size.height; y += gap) {
      canvas.drawLine(Offset(0, y), Offset(size.width, y), paint);
    }

    for (double x = 0; x < size.width; x += gap) {
      canvas.drawLine(Offset(x, 0), Offset(x, size.height), paint);
    }
  }

  @override
  bool shouldRepaint(covariant _ProgressGridPainter oldDelegate) {
    return oldDelegate.color != color;
  }
}
