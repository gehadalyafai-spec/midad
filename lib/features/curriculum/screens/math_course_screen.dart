import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

import '../../../app/theme/app_theme.dart';
import '../../../services/progress_service.dart';
import '../data/grade2_math_data.dart';
import '../models/curriculum_models.dart';
import 'chapter_screen.dart';

class MathCourseScreen extends StatefulWidget {
  const MathCourseScreen({super.key});

  @override
  State<MathCourseScreen> createState() => _MathCourseScreenState();
}

class _MathCourseScreenState extends State<MathCourseScreen> {
  final ProgressService _progressService = ProgressService();

  bool _loading = true;
  Set<String> _completed = const <String>{};

  @override
  void initState() {
    super.initState();
    _load();
  }

  Future<void> _load() async {
    final completed = await _progressService.getCompletedLessonIds();
    if (!mounted) return;
    setState(() {
      _completed = completed;
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

  Future<void> _openChapter(Chapter chapter) async {
    await Navigator.of(context).push(
      MaterialPageRoute<void>(
        builder: (_) => ChapterScreen(chapter: chapter),
      ),
    );
    await _load();
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final text = isDark ? AppColors.darkTextPrimary : AppColors.textPrimary;
    final muted =
        isDark ? AppColors.darkTextSecondary : AppColors.textSecondary;
    final surface = isDark ? AppColors.darkSurface : const Color(0xFFFFFDF8);

    return Scaffold(
      body: SafeArea(
        child: _loading
            ? const Center(child: CircularProgressIndicator())
            : ListView(
                padding: const EdgeInsets.fromLTRB(22, 18, 22, 36),
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
                        'رياضيات • ثاني متوسط',
                        style: TextStyle(
                          color: AppColors.primary,
                          fontWeight: FontWeight.w900,
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 34),
                  Text(
                    'مسار الرياضيات',
                    style: Theme.of(context).textTheme.displaySmall?.copyWith(
                          color: text,
                          fontWeight: FontWeight.w900,
                          height: 1.05,
                        ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    'تقدّم فصلًا بعد فصل، ويمكنك الرجوع لأي فصل مكتمل في أي وقت.',
                    style: TextStyle(
                      color: muted,
                      height: 1.6,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 28),
                  ...List.generate(grade2MathChapters.length, (index) {
                    final chapter = grade2MathChapters[index];
                    final unlocked = _chapterUnlocked(index);
                    final complete = _chapterComplete(chapter);
                    final lessons =
                        chapter.lessons.where((lesson) => lesson.isAvailable);
                    final completedCount =
                        lessons.where((lesson) => _completed.contains(lesson.id)).length;
                    final total = lessons.length;
                    final progress = total == 0 ? 0.0 : completedCount / total;

                    return Padding(
                      padding: const EdgeInsets.only(bottom: 16),
                      child: _ChapterCard(
                        index: index + 1,
                        chapter: chapter,
                        unlocked: unlocked,
                        complete: complete,
                        progress: progress,
                        completed: completedCount,
                        total: total,
                        surface: surface,
                        textColor: text,
                        mutedColor: muted,
                        onTap: unlocked ? () => _openChapter(chapter) : null,
                      )
                          .animate(delay: (index * 70).ms)
                          .fadeIn(duration: 340.ms)
                          .slideY(begin: 0.06, end: 0),
                    );
                  }),
                ],
              ),
      ),
    );
  }
}

class _ChapterCard extends StatelessWidget {
  const _ChapterCard({
    required this.index,
    required this.chapter,
    required this.unlocked,
    required this.complete,
    required this.progress,
    required this.completed,
    required this.total,
    required this.surface,
    required this.textColor,
    required this.mutedColor,
    required this.onTap,
  });

  final int index;
  final Chapter chapter;
  final bool unlocked;
  final bool complete;
  final double progress;
  final int completed;
  final int total;
  final Color surface;
  final Color textColor;
  final Color mutedColor;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final accent = complete
        ? AppColors.primary
        : unlocked
            ? AppColors.secondary
            : mutedColor.withValues(alpha: 0.35);

    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(28),
        child: Container(
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: unlocked ? surface : surface.withValues(alpha: 0.55),
            borderRadius: BorderRadius.circular(28),
            border: Border.all(
              color: accent.withValues(alpha: complete ? 0.35 : 0.22),
            ),
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 58,
                height: 58,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: complete
                      ? AppColors.primary
                      : unlocked
                          ? AppColors.secondary
                          : Colors.transparent,
                  borderRadius: BorderRadius.circular(19),
                  border: Border.all(color: accent),
                ),
                child: complete
                    ? const Icon(Icons.check_rounded, color: Colors.white)
                    : unlocked
                        ? Text(
                            '$index',
                            style: const TextStyle(
                              color: AppColors.primaryDark,
                              fontSize: 20,
                              fontWeight: FontWeight.w900,
                            ),
                          )
                        : Icon(
                            Icons.lock_outline_rounded,
                            color: mutedColor,
                          ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      chapter.title,
                      style: TextStyle(
                        color: unlocked ? textColor : mutedColor,
                        fontSize: 17,
                        fontWeight: FontWeight.w900,
                        height: 1.35,
                      ),
                    ),
                    const SizedBox(height: 7),
                    Text(
                      unlocked
                          ? '$completed من $total دروس مكتملة'
                          : 'أكمل الفصل السابق لفتحه',
                      style: TextStyle(
                        color: complete ? AppColors.primary : mutedColor,
                        fontSize: 12,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    if (unlocked) ...[
                      const SizedBox(height: 12),
                      ClipRRect(
                        borderRadius: BorderRadius.circular(99),
                        child: LinearProgressIndicator(
                          value: progress,
                          minHeight: 6,
                          backgroundColor: mutedColor.withValues(alpha: 0.10),
                          valueColor: AlwaysStoppedAnimation<Color>(
                            complete ? AppColors.primary : AppColors.secondary,
                          ),
                        ),
                      ),
                    ],
                  ],
                ),
              ),
              if (unlocked)
                Padding(
                  padding: const EdgeInsets.only(top: 18),
                  child: Icon(
                    Icons.arrow_back_rounded,
                    color: complete ? AppColors.primary : mutedColor,
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
