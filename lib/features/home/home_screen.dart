import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:shimmer/shimmer.dart';

import '../../app/theme/app_theme.dart';
import '../../services/progress_service.dart';
import '../curriculum/data/grade2_math_data.dart';
import '../curriculum/models/curriculum_models.dart';
import '../curriculum/screens/chapter_screen.dart';
import '../lessons/screens/lesson_screen.dart';
import '../mistakes/screens/mistakes_screen.dart';
import '../progress/screens/progress_screen.dart';
import '../quizzes/data/grade2_math_quiz_registry.dart';
import '../quizzes/screens/quiz_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final ProgressService _progressService = ProgressService();

  bool _isLoading = true;
  Set<String> _completedLessonIds = const <String>{};
  Set<String> _mistakeQuestionIds = const <String>{};
  String? _lastLessonId;

  @override
  void initState() {
    super.initState();
    _loadProgress(showSkeleton: true);
  }

  Future<void> _loadProgress({bool showSkeleton = false}) async {
    if (showSkeleton && mounted) setState(() => _isLoading = true);

    final completed = await _progressService.getCompletedLessonIds();
    final mistakes = await _progressService.getMistakeQuestionIds();
    final lastId = await _progressService.getLastLessonId();
    if (showSkeleton) {
      await Future<void>.delayed(const Duration(milliseconds: 650));
    }

    if (!mounted) return;
    setState(() {
      _completedLessonIds = completed;
      _mistakeQuestionIds = mistakes;
      _lastLessonId = lastId;
      _isLoading = false;
    });
  }

  Lesson? _findLesson(Chapter chapter, String? lessonId) {
    if (lessonId == null) return null;
    for (final lesson in chapter.lessons) {
      if (lesson.id == lessonId && lesson.isAvailable) return lesson;
    }
    return null;
  }

  Lesson _nextLesson(Chapter chapter) {
    final available =
        chapter.lessons.where((lesson) => lesson.isAvailable).toList();

    for (final lesson in available) {
      if (!_completedLessonIds.contains(lesson.id)) {
        return lesson;
      }
    }

    return available.last;
  }

  bool _isChapterComplete(Chapter chapter) {
    final available =
        chapter.lessons.where((lesson) => lesson.isAvailable).toList();
    return available.isNotEmpty &&
        available.every((lesson) => _completedLessonIds.contains(lesson.id));
  }

  Chapter _activeChapter() {
    for (final chapter in grade2MathChapters) {
      if (!_isChapterComplete(chapter)) return chapter;
    }
    return grade2MathChapters.last;
  }

  Future<void> _openChapter(Chapter chapter) async {
    await Navigator.of(context).push(
      MaterialPageRoute<void>(
        builder: (_) => ChapterScreen(chapter: chapter),
      ),
    );
    await _loadProgress();
  }

  Future<void> _continueLearning(Chapter chapter) async {
    final lastLesson = _findLesson(chapter, _lastLessonId);
    final lesson = lastLesson == null ||
            _completedLessonIds.contains(lastLesson.id)
        ? _nextLesson(chapter)
        : lastLesson;

    await Navigator.of(context).push(
      MaterialPageRoute<void>(
        builder: (_) => LessonScreen(lesson: lesson),
      ),
    );
    await _loadProgress();
  }

  Future<void> _openQuiz(Chapter chapter) async {
    final lesson = _nextLesson(chapter);
    await Navigator.of(context).push<bool>(
      MaterialPageRoute<bool>(
        builder: (_) => QuizScreen(
          lesson: lesson,
          questions: quizForGrade2MathLesson(lesson.id),
        ),
      ),
    );
    await _loadProgress();
  }

  Future<void> _openMistakes(Chapter chapter) async {
    final lesson = _nextLesson(chapter);
    await Navigator.of(context).push(
      MaterialPageRoute<void>(
        builder: (_) => MistakesScreen(
          lesson: lesson,
          allQuestions: allGrade2MathQuestions,
        ),
      ),
    );
    await _loadProgress();
  }

  Future<void> _openProgress(Chapter chapter) async {
    await Navigator.of(context).push(
      MaterialPageRoute<void>(
        builder: (_) => ProgressScreen(chapter: chapter),
      ),
    );
    await _loadProgress();
  }

  @override
  Widget build(BuildContext context) {
    final chapter = _activeChapter();
    final available =
        chapter.lessons.where((lesson) => lesson.isAvailable).toList();
    final completed = available
        .where((lesson) => _completedLessonIds.contains(lesson.id))
        .length;
    final progress = available.isEmpty ? 0.0 : completed / available.length;
    final lastLesson = _findLesson(chapter, _lastLessonId);
    final continueLesson = lastLesson == null ||
            _completedLessonIds.contains(lastLesson.id)
        ? _nextLesson(chapter)
        : lastLesson;

    return Scaffold(
      body: SafeArea(
        child: AnimatedSwitcher(
          duration: const Duration(milliseconds: 320),
          child: _isLoading
              ? const _StudySkeleton(key: ValueKey('loading'))
              : _StudyCanvas(
                  key: const ValueKey('canvas'),
                  chapter: chapter,
                  progress: progress,
                  completed: completed,
                  total: available.length,
                  mistakeCount: _mistakeQuestionIds.length,
                  lastLessonTitle: continueLesson.title,
                  onContinue: () => _continueLearning(chapter),
                  onOpenCourse: () => _openChapter(chapter),
                  onQuiz: () => _openQuiz(chapter),
                  onMistakes: () => _openMistakes(chapter),
                  onProgress: () => _openProgress(chapter),
                ),
        ),
      ),
    );
  }
}

class _StudyCanvas extends StatelessWidget {
  const _StudyCanvas({
    super.key,
    required this.chapter,
    required this.progress,
    required this.completed,
    required this.total,
    required this.mistakeCount,
    required this.lastLessonTitle,
    required this.onContinue,
    required this.onOpenCourse,
    required this.onQuiz,
    required this.onMistakes,
    required this.onProgress,
  });

  final Chapter chapter;
  final double progress;
  final int completed;
  final int total;
  final int mistakeCount;
  final String? lastLessonTitle;
  final VoidCallback onContinue;
  final VoidCallback onOpenCourse;
  final VoidCallback onQuiz;
  final VoidCallback onMistakes;
  final VoidCallback onProgress;

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final text = isDark ? AppColors.darkTextPrimary : AppColors.textPrimary;
    final muted =
        isDark ? AppColors.darkTextSecondary : AppColors.textSecondary;
    final surface = isDark ? AppColors.darkSurface : const Color(0xFFFFFDF8);

    return Stack(
      children: [
        Positioned.fill(
          child: CustomPaint(
            painter: _CanvasDotsPainter(
              color: isDark
                  ? Colors.white.withValues(alpha: 0.035)
                  : const Color(0xFF2D2D39).withValues(alpha: 0.045),
            ),
          ),
        ),
        ListView(
          padding: const EdgeInsets.fromLTRB(22, 18, 22, 122),
          children: [
            _TopBar(
              textColor: text,
              mutedColor: muted,
              surface: surface,
            ).animate().fadeIn(duration: 300.ms),
            const SizedBox(height: 34),
            Text(
              'جاهز لدرس\nجديد اليوم؟',
              style: Theme.of(context).textTheme.displaySmall?.copyWith(
                    color: text,
                    fontWeight: FontWeight.w900,
                    height: 1.08,
                    letterSpacing: -1.5,
                  ),
            )
                .animate(delay: 70.ms)
                .fadeIn(duration: 360.ms)
                .slideY(begin: 0.10, end: 0),
            const SizedBox(height: 10),
            Text(
              'ثاني متوسط • الرياضيات • ${chapter.title}',
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: muted,
                    fontWeight: FontWeight.w700,
                  ),
            ).animate(delay: 110.ms).fadeIn(),
            const SizedBox(height: 28),
            _ContinuePanel(
              progress: progress,
              lastLessonTitle: lastLessonTitle,
              onContinue: onContinue,
              onOpenCourse: onOpenCourse,
            )
                .animate(delay: 150.ms)
                .fadeIn(duration: 420.ms)
                .slideY(begin: 0.08, end: 0),
            const SizedBox(height: 28),
            _LearningPath(
              progress: progress,
              onCourse: onOpenCourse,
              onQuiz: onQuiz,
            ).animate(delay: 220.ms).fadeIn(duration: 400.ms),
            const SizedBox(height: 28),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  flex: 6,
                  child: _QuizTile(onTap: onQuiz),
                ),
                const SizedBox(width: 14),
                Expanded(
                  flex: 5,
                  child: Column(
                    children: [
                      _MistakesTile(
                        count: mistakeCount,
                        onTap: onMistakes,
                        surface: surface,
                        textColor: text,
                        mutedColor: muted,
                      ),
                      const SizedBox(height: 14),
                      _ProgressTile(
                        progress: progress,
                        completed: completed,
                        total: total,
                        onTap: onProgress,
                      ),
                    ],
                  ),
                ),
              ],
            )
                .animate(delay: 300.ms)
                .fadeIn(duration: 420.ms)
                .slideY(begin: 0.08, end: 0),
          ],
        ),
        Positioned(
          left: 22,
          right: 22,
          bottom: 18,
          child: _FloatingNav(
            surface: surface,
            onCourse: onOpenCourse,
            onQuiz: onQuiz,
            onProgress: onProgress,
          ),
        ),
      ],
    );
  }
}

class _TopBar extends StatelessWidget {
  const _TopBar({
    required this.textColor,
    required this.mutedColor,
    required this.surface,
  });

  final Color textColor;
  final Color mutedColor;
  final Color surface;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 48,
          height: 48,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: AppColors.primary,
            borderRadius: BorderRadius.circular(14),
          ),
          child: const Text(
            'م',
            style: TextStyle(
              color: Colors.white,
              fontSize: 24,
              fontWeight: FontWeight.w900,
            ),
          ),
        ),
        const SizedBox(width: 12),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'مِداد',
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    color: textColor,
                    fontWeight: FontWeight.w900,
                  ),
            ),
            Text(
              'رحلتك الدراسية',
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    color: mutedColor,
                  ),
            ),
          ],
        ),
        const Spacer(),
        Container(
          decoration: BoxDecoration(
            color: surface,
            borderRadius: BorderRadius.circular(14),
            border: Border.all(
              color: mutedColor.withValues(alpha: 0.14),
            ),
          ),
          child: IconButton(
            onPressed: () {},
            icon: Icon(Icons.notifications_none_rounded, color: textColor),
          ),
        ),
      ],
    );
  }
}

class _ContinuePanel extends StatelessWidget {
  const _ContinuePanel({
    required this.progress,
    required this.lastLessonTitle,
    required this.onContinue,
    required this.onOpenCourse,
  });

  final double progress;
  final String? lastLessonTitle;
  final VoidCallback onContinue;
  final VoidCallback onOpenCourse;

  @override
  Widget build(BuildContext context) {
    final percent = (progress * 100).round();

    return Container(
      constraints: const BoxConstraints(minHeight: 230),
      decoration: BoxDecoration(
        color: AppColors.primaryDark,
        borderRadius: BorderRadius.circular(32),
      ),
      clipBehavior: Clip.antiAlias,
      child: Stack(
        children: [
          PositionedDirectional(
            end: -30,
            top: -18,
            child: Container(
              width: 170,
              height: 170,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: AppColors.secondary,
              ),
            ),
          ),
          PositionedDirectional(
            end: 42,
            bottom: -54,
            child: Transform.rotate(
              angle: -0.24,
              child: Container(
                width: 150,
                height: 150,
                decoration: BoxDecoration(
                  color: AppColors.accent,
                  borderRadius: BorderRadius.circular(42),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(24),
            child: Row(
              children: [
                Expanded(
                  flex: 7,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'واصل من حيث توقفت',
                        style: TextStyle(
                          color: Colors.white70,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        lastLessonTitle ?? 'الأعداد النسبية',
                        style:
                            Theme.of(context).textTheme.headlineSmall?.copyWith(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w900,
                                  height: 1.2,
                                ),
                      ),
                      const SizedBox(height: 18),
                      Row(
                        children: [
                          Expanded(
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(99),
                              child: LinearProgressIndicator(
                                value: progress,
                                minHeight: 8,
                                backgroundColor: Colors.white24,
                                valueColor: const AlwaysStoppedAnimation<Color>(
                                  AppColors.secondary,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(width: 10),
                          Text(
                            '$percent%',
                            style: const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w900,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 22),
                      Wrap(
                        spacing: 10,
                        runSpacing: 10,
                        children: [
                          FilledButton(
                            onPressed: onContinue,
                            style: FilledButton.styleFrom(
                              backgroundColor: Colors.white,
                              foregroundColor: AppColors.primaryDark,
                            ),
                            child: const Text(
                              'متابعة الدرس',
                              style: TextStyle(fontWeight: FontWeight.w900),
                            ),
                          ),
                          TextButton(
                            onPressed: onOpenCourse,
                            style: TextButton.styleFrom(
                              foregroundColor: Colors.white,
                            ),
                            child: const Text('عرض الفصل'),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                const Spacer(flex: 2),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _LearningPath extends StatelessWidget {
  const _LearningPath({
    required this.progress,
    required this.onCourse,
    required this.onQuiz,
  });

  final double progress;
  final VoidCallback onCourse;
  final VoidCallback onQuiz;

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final text = isDark ? AppColors.darkTextPrimary : AppColors.textPrimary;
    final muted =
        isDark ? AppColors.darkTextSecondary : AppColors.textSecondary;

    final steps = [
      _PathStep('افهم', Icons.menu_book_rounded, true, onCourse),
      _PathStep('جرّب', Icons.edit_rounded, progress > 0, onCourse),
      _PathStep('اختبر', Icons.bolt_rounded, progress >= 1, onQuiz),
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'مسار اليوم',
          style: Theme.of(context).textTheme.titleLarge?.copyWith(
                color: text,
                fontWeight: FontWeight.w900,
              ),
        ),
        const SizedBox(height: 6),
        Text(
          'ثلاث خطوات قصيرة بدل جلسة طويلة.',
          style: TextStyle(color: muted),
        ),
        const SizedBox(height: 18),
        Row(
          children: List.generate(steps.length * 2 - 1, (index) {
            if (index.isOdd) {
              return Expanded(
                child: Container(
                  height: 2,
                  color: AppColors.primary.withValues(alpha: 0.18),
                ),
              );
            }
            return _PathNode(step: steps[index ~/ 2]);
          }),
        ),
      ],
    );
  }
}

class _PathStep {
  const _PathStep(this.label, this.icon, this.done, this.onTap);

  final String label;
  final IconData icon;
  final bool done;
  final VoidCallback onTap;
}

class _PathNode extends StatelessWidget {
  const _PathNode({required this.step});

  final _PathStep step;

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return InkWell(
      onTap: step.onTap,
      borderRadius: BorderRadius.circular(18),
      child: Column(
        children: [
          Container(
            width: 54,
            height: 54,
            decoration: BoxDecoration(
              color: step.done ? AppColors.primary : colors.surface,
              borderRadius: BorderRadius.circular(18),
              border: Border.all(
                color: step.done
                    ? AppColors.primary
                    : colors.outlineVariant,
              ),
            ),
            child: Icon(
              step.done ? Icons.check_rounded : step.icon,
              color: step.done ? Colors.white : colors.onSurfaceVariant,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            step.label,
            style: const TextStyle(fontWeight: FontWeight.w800),
          ),
        ],
      ),
    );
  }
}

class _QuizTile extends StatelessWidget {
  const _QuizTile({required this.onTap});

  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(28),
      child: Container(
        height: 290,
        padding: const EdgeInsets.all(22),
        decoration: BoxDecoration(
          color: AppColors.secondary,
          borderRadius: BorderRadius.circular(28),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Icon(
              Icons.bolt_rounded,
              size: 34,
              color: AppColors.primaryDark,
            ),
            const Spacer(),
            Text(
              'اختبار\nسريع',
              style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                    color: AppColors.primaryDark,
                    fontWeight: FontWeight.w900,
                    height: 1.0,
                  ),
            ),
            const SizedBox(height: 10),
            const Text(
              '5 أسئلة • مع شرح لكل إجابة',
              style: TextStyle(
                color: AppColors.primaryDark,
                fontWeight: FontWeight.w700,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _MistakesTile extends StatelessWidget {
  const _MistakesTile({
    required this.count,
    required this.onTap,
    required this.surface,
    required this.textColor,
    required this.mutedColor,
  });

  final int count;
  final VoidCallback onTap;
  final Color surface;
  final Color textColor;
  final Color mutedColor;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(24),
      child: Container(
        height: 138,
        padding: const EdgeInsets.all(18),
        decoration: BoxDecoration(
          color: surface,
          borderRadius: BorderRadius.circular(24),
          border: Border.all(color: mutedColor.withValues(alpha: 0.14)),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Icon(Icons.refresh_rounded, color: AppColors.accent),
            const Spacer(),
            Text(
              count == 0 ? 'لا أخطاء' : '$count أخطاء',
              style: TextStyle(
                color: textColor,
                fontSize: 19,
                fontWeight: FontWeight.w900,
              ),
            ),
            Text('للمراجعة', style: TextStyle(color: mutedColor)),
          ],
        ),
      ),
    );
  }
}

class _ProgressTile extends StatelessWidget {
  const _ProgressTile({
    required this.progress,
    required this.completed,
    required this.total,
    required this.onTap,
  });

  final double progress;
  final int completed;
  final int total;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final percent = (progress * 100).round();

    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(24),
      child: Container(
      height: 138,
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: AppColors.primary,
        borderRadius: BorderRadius.circular(24),
      ),
      child: Row(
        children: [
          SizedBox(
            width: 58,
            height: 58,
            child: Stack(
              alignment: Alignment.center,
              children: [
                CircularProgressIndicator(
                  value: progress,
                  strokeWidth: 6,
                  backgroundColor: Colors.white24,
                  valueColor:
                      const AlwaysStoppedAnimation<Color>(Colors.white),
                ),
                Text(
                  '$percent%',
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w900,
                    fontSize: 11,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              '$completed من $total\nمكتمل',
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w800,
                height: 1.35,
              ),
            ),
          ),
        ],
      ),
      ),
    );
  }
}

class _FloatingNav extends StatelessWidget {
  const _FloatingNav({
    required this.surface,
    required this.onCourse,
    required this.onQuiz,
    required this.onProgress,
  });

  final Color surface;
  final VoidCallback onCourse;
  final VoidCallback onQuiz;
  final VoidCallback onProgress;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 72,
      padding: const EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
        color: surface.withValues(alpha: 0.96),
        borderRadius: BorderRadius.circular(24),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.10),
            blurRadius: 28,
            offset: const Offset(0, 12),
          ),
        ],
      ),
      child: Row(
        children: [
          Expanded(
            child: _NavItem(
              icon: Icons.home_rounded,
              label: 'الرئيسية',
              active: true,
              onTap: () {},
            ),
          ),
          Expanded(
            child: _NavItem(
              icon: Icons.route_rounded,
              label: 'المسار',
              onTap: onCourse,
            ),
          ),
          Expanded(
            child: _NavItem(
              icon: Icons.bolt_rounded,
              label: 'اختبر',
              onTap: onQuiz,
            ),
          ),
          Expanded(
            child: _NavItem(
              icon: Icons.bar_chart_rounded,
              label: 'تقدمي',
              onTap: onProgress,
            ),
          ),
        ],
      ),
    );
  }
}

class _NavItem extends StatelessWidget {
  const _NavItem({
    required this.icon,
    required this.label,
    required this.onTap,
    this.active = false,
  });

  final IconData icon;
  final String label;
  final VoidCallback onTap;
  final bool active;

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(16),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 9),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              size: 21,
              color: active ? AppColors.primary : colors.onSurfaceVariant,
            ),
            const SizedBox(height: 4),
            Text(
              label,
              style: TextStyle(
                fontSize: 10,
                fontWeight: active ? FontWeight.w900 : FontWeight.w700,
                color: active ? AppColors.primary : colors.onSurfaceVariant,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _CanvasDotsPainter extends CustomPainter {
  const _CanvasDotsPainter({required this.color});

  final Color color;

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()..color = color;
    const gap = 24.0;
    for (double y = 10; y < size.height; y += gap) {
      for (double x = 10; x < size.width; x += gap) {
        canvas.drawCircle(Offset(x, y), 1.1, paint);
      }
    }
  }

  @override
  bool shouldRepaint(covariant _CanvasDotsPainter oldDelegate) {
    return oldDelegate.color != color;
  }
}

class _StudySkeleton extends StatelessWidget {
  const _StudySkeleton({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final base =
        isDark ? const Color(0xFF20212C) : const Color(0xFFE2DED6);
    final highlight =
        isDark ? const Color(0xFF30313F) : const Color(0xFFF7F4EE);

    return Shimmer.fromColors(
      baseColor: base,
      highlightColor: highlight,
      child: ListView(
        padding: const EdgeInsets.fromLTRB(22, 18, 22, 110),
        children: const [
          Row(
            children: [
              _Skeleton(width: 48, height: 48, radius: 14),
              SizedBox(width: 12),
              _Skeleton(width: 110, height: 42, radius: 10),
            ],
          ),
          SizedBox(height: 34),
          _Skeleton(height: 90, radius: 18),
          SizedBox(height: 28),
          _Skeleton(height: 230, radius: 32),
          SizedBox(height: 28),
          _Skeleton(height: 116, radius: 24),
          SizedBox(height: 28),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                flex: 6,
                child: _Skeleton(height: 290, radius: 28),
              ),
              SizedBox(width: 14),
              Expanded(
                flex: 5,
                child: Column(
                  children: [
                    _Skeleton(height: 138, radius: 24),
                    SizedBox(height: 14),
                    _Skeleton(height: 138, radius: 24),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _Skeleton extends StatelessWidget {
  const _Skeleton({
    required this.height,
    this.width = double.infinity,
    this.radius = 18,
  });

  final double height;
  final double width;
  final double radius;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(radius),
      ),
    );
  }
}
