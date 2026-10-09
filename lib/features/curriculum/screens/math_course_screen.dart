import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

import '../../../app/theme/app_theme.dart';
import '../../../services/progress_service.dart';
import '../../quizzes/data/course_exam_builder.dart';
import '../../quizzes/screens/quiz_screen.dart';
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
  int? _bestCourseExamScore;

  @override
  void initState() {
    super.initState();
    _load();
  }

  Future<void> _load() async {
    final completed = await _progressService.getCompletedLessonIds();
    final bestCourseExamScore = await _progressService.getExamBestScore(
      'grade2-math-course-exam',
    );
    if (!mounted) return;
    setState(() {
      _completed = completed;
      _bestCourseExamScore = bestCourseExamScore;
      _loading = false;
    });
  }

  bool _chapterComplete(Chapter chapter) {
    final lessons = chapter.lessons.where((lesson) => lesson.isAvailable);
    return lessons.isNotEmpty &&
        lessons.every((lesson) => _completed.contains(lesson.id));
  }

  Future<void> _openChapter(Chapter chapter) async {
    await Navigator.of(context).push(
      MaterialPageRoute<void>(
        builder: (_) => ChapterScreen(chapter: chapter),
      ),
    );
    await _load();
  }

  Future<void> _openCourseExam() async {
    final questions = courseExamQuestions(grade2MathChapters);
    if (questions.isEmpty) return;

    const examId = 'grade2-math-course-exam';
    final examLesson = const Lesson(
      id: examId,
      title: 'الاختبار الشامل لرياضيات ثاني متوسط',
      subtitle: 'مراجعة شاملة تغطي الفصول العشرة.',
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
    await _load();
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
    final overallProgress =
        allLessons.isEmpty ? 0.0 : completedLessons / allLessons.length;

    var activeChapterIndex = grade2MathChapters.length - 1;
    for (var index = 0; index < grade2MathChapters.length; index++) {
      if (!_chapterComplete(grade2MathChapters[index])) {
        activeChapterIndex = index;
        break;
      }
    }

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
                    'اختر أي فصل تريد مراجعته، وسيبقى تقدمك محفوظًا في كل درس.',
                    style: TextStyle(
                      color: muted,
                      height: 1.6,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 22),
                  _CourseSummary(
                    progress: overallProgress,
                    completed: completedLessons,
                    total: allLessons.length,
                    activeChapterIndex: activeChapterIndex,
                  ).animate(delay: 60.ms).fadeIn(duration: 320.ms),
                  const SizedBox(height: 28),
                  ...List.generate(grade2MathChapters.length, (index) {
                    final chapter = grade2MathChapters[index];
                    const unlocked = true;
                    final complete = _chapterComplete(chapter);
                    final lessons =
                        chapter.lessons.where((lesson) => lesson.isAvailable);
                    final completedCount =
                        lessons.where((lesson) => _completed.contains(lesson.id)).length;
                    final total = lessons.length;
                    final progress = total == 0 ? 0.0 : completedCount / total;

                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        if (index == 0 || index == 5) ...[
                          _SemesterHeader(
                            title: index == 0
                                ? 'الفصل الدراسي الأول'
                                : 'الفصل الدراسي الثاني',
                            chapterRange: index == 0
                                ? 'الفصول 1 – 5'
                                : 'الفصول 6 – 10',
                            accent: index == 0
                                ? AppColors.primary
                                : AppColors.accent,
                            textColor: text,
                            mutedColor: muted,
                          ),
                          const SizedBox(height: 14),
                        ],
                        Padding(
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
                            onTap: () => _openChapter(chapter),
                          )
                              .animate(delay: (index * 70).ms)
                              .fadeIn(duration: 340.ms)
                              .slideY(begin: 0.06, end: 0),
                        ),
                      ],
                    );
                  }),
                  const SizedBox(height: 10),
                  _CourseExamCard(
                    completedLessons: completedLessons,
                    totalLessons: allLessons.length,
                    bestScore: _bestCourseExamScore,
                    onTap: _openCourseExam,
                  ).animate(delay: 760.ms).fadeIn(duration: 360.ms),
                ],
              ),
      ),
    );
  }
}

class _CourseExamCard extends StatelessWidget {
  const _CourseExamCard({
    required this.completedLessons,
    required this.totalLessons,
    this.bestScore,
    required this.onTap,
  });

  final int completedLessons;
  final int totalLessons;
  final int? bestScore;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final allDone = totalLessons > 0 && completedLessons == totalLessons;

    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(30),
        child: Container(
          padding: const EdgeInsets.all(22),
          decoration: BoxDecoration(
            color: AppColors.primaryDark,
            borderRadius: BorderRadius.circular(30),
          ),
          child: Row(
            children: [
              Container(
                width: 62,
                height: 62,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: AppColors.secondary,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: const Icon(
                  Icons.emoji_events_rounded,
                  color: AppColors.primaryDark,
                  size: 32,
                ),
              ),
              const SizedBox(width: 15),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'الاختبار الشامل للمادة',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w900,
                        fontSize: 18,
                      ),
                    ),
                    const SizedBox(height: 6),
                    const Text(
                      '20 سؤالًا • سؤالان من مناطق مختلفة في كل فصل',
                      style: TextStyle(
                        color: Colors.white70,
                        height: 1.5,
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 7),
                    Text(
                      allDone
                          ? 'أكملت جميع الدروس • جاهز للمراجعة النهائية'
                          : '$completedLessons من $totalLessons درسًا مكتملًا',
                      style: TextStyle(
                        color: allDone
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

class _CourseSummary extends StatelessWidget {
  const _CourseSummary({
    required this.progress,
    required this.completed,
    required this.total,
    required this.activeChapterIndex,
  });

  final double progress;
  final int completed;
  final int total;
  final int activeChapterIndex;

  @override
  Widget build(BuildContext context) {
    final percent = (progress * 100).round();

    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: AppColors.primaryDark,
        borderRadius: BorderRadius.circular(28),
      ),
      child: Row(
        children: [
          SizedBox(
            width: 82,
            height: 82,
            child: Stack(
              alignment: Alignment.center,
              children: [
                CircularProgressIndicator(
                  value: progress,
                  strokeWidth: 8,
                  backgroundColor: Colors.white12,
                  valueColor: const AlwaysStoppedAnimation<Color>(
                    AppColors.secondary,
                  ),
                ),
                Text(
                  '$percent%',
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w900,
                    fontSize: 18,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 18),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'تقدم المادة',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w900,
                    fontSize: 17,
                  ),
                ),
                const SizedBox(height: 6),
                Text(
                  '$completed من $total درسًا',
                  style: const TextStyle(
                    color: Colors.white70,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const SizedBox(height: 10),
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
                    'الفصل الحالي ${activeChapterIndex + 1} من ${grade2MathChapters.length}',
                    style: const TextStyle(
                      color: AppColors.secondary,
                      fontWeight: FontWeight.w900,
                      fontSize: 10,
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

class _SemesterHeader extends StatelessWidget {
  const _SemesterHeader({
    required this.title,
    required this.chapterRange,
    required this.accent,
    required this.textColor,
    required this.mutedColor,
  });

  final String title;
  final String chapterRange;
  final Color accent;
  final Color textColor;
  final Color mutedColor;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8),
      child: Row(
        children: [
          Container(
            width: 10,
            height: 42,
            decoration: BoxDecoration(
              color: accent,
              borderRadius: BorderRadius.circular(99),
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    color: textColor,
                    fontSize: 16,
                    fontWeight: FontWeight.w900,
                  ),
                ),
                const SizedBox(height: 3),
                Text(
                  chapterRange,
                  style: TextStyle(
                    color: mutedColor,
                    fontSize: 11,
                    fontWeight: FontWeight.w700,
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
                      '$completed من $total دروس مكتملة',
                      style: TextStyle(
                        color: complete ? AppColors.primary : mutedColor,
                        fontSize: 12,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    ...[
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
