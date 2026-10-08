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
import '../quizzes/data/rational_numbers_quiz.dart';
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
  String? _lastLessonTitle;

  @override
  void initState() {
    super.initState();
    _loadProgress(showSkeleton: true);
  }

  Future<void> _loadProgress({bool showSkeleton = false}) async {
    if (showSkeleton && mounted) {
      setState(() => _isLoading = true);
    }

    final completedFuture = _progressService.getCompletedLessonIds();
    final mistakesFuture = _progressService.getMistakeQuestionIds();
    final lastIdFuture = _progressService.getLastLessonId();
    final lastTitleFuture = _progressService.getLastLessonTitle();

    final completed = await completedFuture;
    final mistakes = await mistakesFuture;
    final lastId = await lastIdFuture;
    final lastTitle = await lastTitleFuture;

    if (showSkeleton) {
      await Future<void>.delayed(const Duration(milliseconds: 700));
    }

    if (!mounted) return;
    setState(() {
      _completedLessonIds = completed;
      _mistakeQuestionIds = mistakes;
      _lastLessonId = lastId;
      _lastLessonTitle = lastTitle;
      _isLoading = false;
    });
  }

  Lesson? _findLesson(Chapter chapter, String? lessonId) {
    if (lessonId == null) return null;

    for (final lesson in chapter.lessons) {
      if (lesson.id == lessonId && lesson.isAvailable) {
        return lesson;
      }
    }
    return null;
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

    if (lastLesson == null) {
      await _openChapter(chapter);
      return;
    }

    await Navigator.of(context).push(
      MaterialPageRoute<void>(
        builder: (_) => LessonScreen(lesson: lastLesson),
      ),
    );
    await _loadProgress();
  }

  Future<void> _openStarterQuiz(Chapter chapter) async {
    final lesson = chapter.lessons.firstWhere((item) => item.isAvailable);

    await Navigator.of(context).push<bool>(
      MaterialPageRoute<bool>(
        builder: (_) => QuizScreen(
          lesson: lesson,
          questions: rationalNumbersIntroQuiz,
        ),
      ),
    );
    await _loadProgress();
  }

  Future<void> _openMistakes(Chapter chapter) async {
    final lesson = chapter.lessons.firstWhere((item) => item.isAvailable);

    await Navigator.of(context).push(
      MaterialPageRoute<void>(
        builder: (_) => MistakesScreen(
          lesson: lesson,
          allQuestions: rationalNumbersIntroQuiz,
        ),
      ),
    );
    await _loadProgress();
  }

  @override
  Widget build(BuildContext context) {
    final firstChapter = grade2MathChapters.first;
    final availableLessons =
        firstChapter.lessons.where((lesson) => lesson.isAvailable).toList();
    final completedCount = availableLessons
        .where((lesson) => _completedLessonIds.contains(lesson.id))
        .length;
    final progress =
        availableLessons.isEmpty ? 0.0 : completedCount / availableLessons.length;

    final colors = Theme.of(context).colorScheme;
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 78,
        leadingWidth: 76,
        leading: Padding(
          padding: const EdgeInsetsDirectional.only(start: 18),
          child: DecoratedBox(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                color: colors.outlineVariant.withValues(alpha: 0.55),
              ),
            ),
            child: CircleAvatar(
              backgroundColor: colors.primaryContainer,
              child: Icon(
                Icons.person_rounded,
                color: colors.onPrimaryContainer,
              ),
            ),
          ),
        ),
        titleSpacing: 6,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'مداد',
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    fontWeight: FontWeight.w900,
                    letterSpacing: -0.4,
                  ),
            ),
            Text(
              'تعلّم بهدوء، وتقدّم بثبات',
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    color: colors.onSurfaceVariant,
                  ),
            ),
          ],
        ),
        actions: [
          Padding(
            padding: const EdgeInsetsDirectional.only(end: 16),
            child: IconButton.filledTonal(
              tooltip: 'الإشعارات',
              onPressed: () => _showComingSoon(context, 'الإشعارات'),
              icon: const Icon(Icons.notifications_none_rounded),
            ),
          ),
        ],
      ),
      body: AnimatedSwitcher(
        duration: const Duration(milliseconds: 350),
        switchInCurve: Curves.easeOutCubic,
        switchOutCurve: Curves.easeInCubic,
        child: _isLoading
            ? const _HomeSkeleton(key: ValueKey('loading'))
            : ListView(
                key: const ValueKey('content'),
                padding: const EdgeInsets.fromLTRB(18, 10, 18, 32),
                children: [
                  _WelcomeCard(
                    isDark: isDark,
                    lastLessonTitle: _lastLessonTitle,
                    onContinue: () => _continueLearning(firstChapter),
                  )
                      .animate()
                      .fadeIn(duration: 420.ms)
                      .slideY(
                        begin: 0.08,
                        end: 0,
                        duration: 420.ms,
                        curve: Curves.easeOutCubic,
                      ),
                  const SizedBox(height: 26),
                  _SectionHeader(
                    title: 'مساحتك التعليمية',
                    subtitle: 'كل ما تحتاجه لتتقدم في مكان واحد',
                    trailing: 'ثاني متوسط',
                  )
                      .animate(delay: 80.ms)
                      .fadeIn(duration: 380.ms)
                      .slideX(begin: 0.04, end: 0),
                  const SizedBox(height: 14),
                  _LearningGrid(
                    progress: progress,
                    mistakeCount: _mistakeQuestionIds.length,
                    onOpenMath: () => _openChapter(firstChapter),
                    onOpenQuiz: () => _openStarterQuiz(firstChapter),
                    onReviewMistakes: () => _openMistakes(firstChapter),
                    onShowProgress: () {
                      final percent = (progress * 100).round();
                      _showMessage(
                        context,
                        'أنجزت $completedCount من ${availableLessons.length} درس • $percent%',
                      );
                    },
                  ),
                  const SizedBox(height: 26),
                  const _SectionHeader(
                    title: 'تقدمك',
                    subtitle: 'يُحفظ تلقائيًا على جهازك',
                  )
                      .animate(delay: 220.ms)
                      .fadeIn(duration: 380.ms)
                      .slideX(begin: 0.04, end: 0),
                  const SizedBox(height: 14),
                  _ProgressCard(
                    chapterTitle: firstChapter.title,
                    progress: progress,
                    completed: completedCount,
                    total: availableLessons.length,
                    lastLessonTitle: _lastLessonTitle,
                  )
                      .animate(delay: 280.ms)
                      .fadeIn(duration: 420.ms)
                      .slideY(begin: 0.06, end: 0),
                ],
              ),
      ),
    );
  }

  void _showComingSoon(BuildContext context, String feature) {
    _showMessage(context, '$feature سيُضاف قريبًا بإذن الله.');
  }

  void _showMessage(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message)),
    );
  }
}

class _WelcomeCard extends StatelessWidget {
  const _WelcomeCard({
    required this.isDark,
    required this.lastLessonTitle,
    required this.onContinue,
  });

  final bool isDark;
  final String? lastLessonTitle;
  final VoidCallback onContinue;

  @override
  Widget build(BuildContext context) {
    final hasLastLesson = lastLessonTitle != null;

    return Container(
      padding: const EdgeInsets.all(22),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(28),
        gradient: LinearGradient(
          colors: isDark
              ? const [Color(0xFF1B6658), Color(0xFF103F37)]
              : const [Color(0xFF1E7A68), Color(0xFF125649)],
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
        ),
        boxShadow: [
          BoxShadow(
            color: AppColors.primary.withValues(alpha: isDark ? 0.10 : 0.20),
            blurRadius: 28,
            offset: const Offset(0, 12),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                width: 46,
                height: 46,
                decoration: BoxDecoration(
                  color: Colors.white.withValues(alpha: 0.14),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: const Icon(
                  Icons.auto_stories_rounded,
                  color: Colors.white,
                ),
              ),
              const Spacer(),
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 7,
                ),
                decoration: BoxDecoration(
                  color: Colors.white.withValues(alpha: 0.12),
                  borderRadius: BorderRadius.circular(999),
                  border: Border.all(
                    color: Colors.white.withValues(alpha: 0.12),
                  ),
                ),
                child: const Text(
                  'رياضيات • ثاني متوسط',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 12,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 24),
          Text(
            hasLastLesson ? 'واصل من حيث توقفت' : 'مرحبًا بك في مداد',
            style: const TextStyle(
              color: Colors.white,
              fontSize: 27,
              fontWeight: FontWeight.w900,
              letterSpacing: -0.5,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            hasLastLesson
                ? 'آخر درس فتحته: $lastLessonTitle'
                : 'ابدأ أول درس، وافهم الفكرة ثم اختبر نفسك بخطوات قصيرة وواضحة.',
            style: TextStyle(
              color: Colors.white.withValues(alpha: 0.82),
              height: 1.65,
              fontSize: 14,
            ),
          ),
          const SizedBox(height: 22),
          FilledButton.icon(
            onPressed: onContinue,
            style: FilledButton.styleFrom(
              backgroundColor: Colors.white,
              foregroundColor: AppColors.primaryDark,
              padding: const EdgeInsets.symmetric(
                horizontal: 18,
                vertical: 14,
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
            ),
            icon: Icon(
              hasLastLesson
                  ? Icons.play_arrow_rounded
                  : Icons.arrow_back_rounded,
            ),
            label: Text(
              hasLastLesson ? 'أكمل التعلّم' : 'ابدأ الآن',
              style: const TextStyle(fontWeight: FontWeight.w800),
            ),
          ),
        ],
      ),
    );
  }
}

class _SectionHeader extends StatelessWidget {
  const _SectionHeader({
    required this.title,
    required this.subtitle,
    this.trailing,
  });

  final String title;
  final String subtitle;
  final String? trailing;

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      fontWeight: FontWeight.w900,
                      letterSpacing: -0.3,
                    ),
              ),
              const SizedBox(height: 4),
              Text(
                subtitle,
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      color: colors.onSurfaceVariant,
                    ),
              ),
            ],
          ),
        ),
        if (trailing != null)
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
            decoration: BoxDecoration(
              color: colors.secondaryContainer.withValues(alpha: 0.55),
              borderRadius: BorderRadius.circular(999),
            ),
            child: Text(
              trailing!,
              style: TextStyle(
                color: colors.onSecondaryContainer,
                fontSize: 11,
                fontWeight: FontWeight.w800,
              ),
            ),
          ),
      ],
    );
  }
}

class _LearningGrid extends StatelessWidget {
  const _LearningGrid({
    required this.progress,
    required this.mistakeCount,
    required this.onOpenMath,
    required this.onOpenQuiz,
    required this.onReviewMistakes,
    required this.onShowProgress,
  });

  final double progress;
  final int mistakeCount;
  final VoidCallback onOpenMath;
  final VoidCallback onOpenQuiz;
  final VoidCallback onReviewMistakes;
  final VoidCallback onShowProgress;

  @override
  Widget build(BuildContext context) {
    final tasks = <_LearningTask>[
      _LearningTask(
        icon: Icons.calculate_rounded,
        title: 'الرياضيات',
        subtitle: 'الأعداد النسبية',
        badge: 'ابدأ الآن',
        enabled: true,
        onTap: onOpenMath,
      ),
      _LearningTask(
        icon: Icons.fact_check_outlined,
        title: 'اختبر نفسك',
        subtitle: '5 أسئلة مع شرح الإجابة',
        badge: 'متاح',
        enabled: true,
        onTap: onOpenQuiz,
      ),
      _LearningTask(
        icon: Icons.replay_rounded,
        title: 'راجع أخطاءك',
        subtitle: 'صحح الأسئلة التي أخطأت فيها',
        badge: mistakeCount == 0 ? 'لا أخطاء' : '$mistakeCount أخطاء',
        enabled: true,
        onTap: onReviewMistakes,
      ),
      _LearningTask(
        icon: Icons.insights_rounded,
        title: 'تقدمك',
        subtitle: 'نسبة الإتقان المحفوظة',
        badge: '${(progress * 100).round()}%',
        enabled: true,
        onTap: onShowProgress,
      ),
    ];

    return LayoutBuilder(
      builder: (context, constraints) {
        final columns = constraints.maxWidth >= 760 ? 4 : 2;
        final ratio = constraints.maxWidth >= 760 ? 1.12 : 0.94;

        return GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: tasks.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: columns,
            crossAxisSpacing: 12,
            mainAxisSpacing: 12,
            childAspectRatio: ratio,
          ),
          itemBuilder: (context, index) {
            return _LearningTaskCard(task: tasks[index])
                .animate(delay: (120 + index * 70).ms)
                .fadeIn(duration: 380.ms)
                .slideY(
                  begin: 0.08,
                  end: 0,
                  duration: 380.ms,
                  curve: Curves.easeOutCubic,
                );
          },
        );
      },
    );
  }
}

class _LearningTask {
  const _LearningTask({
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.badge,
    required this.onTap,
    this.enabled = false,
  });

  final IconData icon;
  final String title;
  final String subtitle;
  final String badge;
  final VoidCallback onTap;
  final bool enabled;
}

class _LearningTaskCard extends StatelessWidget {
  const _LearningTaskCard({required this.task});

  final _LearningTask task;

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Material(
      color: isDark ? AppColors.darkSurface : Colors.white,
      borderRadius: BorderRadius.circular(22),
      child: InkWell(
        onTap: task.onTap,
        borderRadius: BorderRadius.circular(22),
        child: Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(22),
            border: Border.all(
              color: isDark
                  ? Colors.white.withValues(alpha: 0.07)
                  : const Color(0xFFE4EAE6),
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Container(
                    width: 42,
                    height: 42,
                    decoration: BoxDecoration(
                      color: task.enabled
                          ? colors.primaryContainer
                          : colors.surfaceContainerHighest,
                      borderRadius: BorderRadius.circular(14),
                    ),
                    child: Icon(
                      task.icon,
                      size: 21,
                      color: task.enabled
                          ? colors.onPrimaryContainer
                          : colors.onSurfaceVariant,
                    ),
                  ),
                  const Spacer(),
                  Text(
                    task.badge,
                    style: TextStyle(
                      color: task.enabled
                          ? colors.primary
                          : colors.onSurfaceVariant,
                      fontSize: 10,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                ],
              ),
              const Spacer(),
              Text(
                task.title,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.w900,
                    ),
              ),
              const SizedBox(height: 5),
              Text(
                task.subtitle,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      color: colors.onSurfaceVariant,
                      height: 1.45,
                    ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _ProgressCard extends StatelessWidget {
  const _ProgressCard({
    required this.chapterTitle,
    required this.progress,
    required this.completed,
    required this.total,
    required this.lastLessonTitle,
  });

  final String chapterTitle;
  final double progress;
  final int completed;
  final int total;
  final String? lastLessonTitle;

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final percent = (progress * 100).round();

    return Container(
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: isDark ? AppColors.darkSurface : Colors.white,
        borderRadius: BorderRadius.circular(22),
        border: Border.all(
          color: isDark
              ? Colors.white.withValues(alpha: 0.07)
              : const Color(0xFFE4EAE6),
        ),
      ),
      child: Row(
        children: [
          SizedBox(
            width: 62,
            height: 62,
            child: Stack(
              alignment: Alignment.center,
              children: [
                CircularProgressIndicator(
                  value: progress,
                  strokeWidth: 7,
                  strokeCap: StrokeCap.round,
                  backgroundColor: colors.surfaceContainerHighest,
                  color: progress >= 1 ? Colors.green : colors.primary,
                ),
                Text(
                  '$percent%',
                  style: TextStyle(
                    color: colors.onSurface,
                    fontSize: 12,
                    fontWeight: FontWeight.w900,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  chapterTitle,
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.w900,
                      ),
                ),
                const SizedBox(height: 5),
                Text(
                  '$completed من $total درس مكتمل',
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        color: colors.primary,
                        fontWeight: FontWeight.w800,
                      ),
                ),
                if (lastLessonTitle != null) ...[
                  const SizedBox(height: 4),
                  Text(
                    'آخر درس: $lastLessonTitle',
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          color: colors.onSurfaceVariant,
                        ),
                  ),
                ],
              ],
            ),
          ),
          Icon(
            progress >= 1
                ? Icons.verified_rounded
                : Icons.arrow_back_ios_new_rounded,
            size: progress >= 1 ? 22 : 16,
            color: progress >= 1 ? Colors.green : colors.onSurfaceVariant,
          ),
        ],
      ),
    );
  }
}

class _HomeSkeleton extends StatelessWidget {
  const _HomeSkeleton({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final base = isDark ? const Color(0xFF1D2623) : const Color(0xFFE6EBE8);
    final highlight =
        isDark ? const Color(0xFF2C3935) : const Color(0xFFF6F8F7);

    return Shimmer.fromColors(
      baseColor: base,
      highlightColor: highlight,
      child: ListView(
        padding: const EdgeInsets.fromLTRB(18, 10, 18, 32),
        children: const [
          _SkeletonBox(height: 208, radius: 28),
          SizedBox(height: 26),
          _SkeletonBox(height: 22, widthFactor: 0.42),
          SizedBox(height: 14),
          Row(
            children: [
              Expanded(child: _SkeletonBox(height: 150, radius: 22)),
              SizedBox(width: 12),
              Expanded(child: _SkeletonBox(height: 150, radius: 22)),
            ],
          ),
          SizedBox(height: 12),
          Row(
            children: [
              Expanded(child: _SkeletonBox(height: 150, radius: 22)),
              SizedBox(width: 12),
              Expanded(child: _SkeletonBox(height: 150, radius: 22)),
            ],
          ),
          SizedBox(height: 26),
          _SkeletonBox(height: 22, widthFactor: 0.32),
          SizedBox(height: 14),
          _SkeletonBox(height: 98, radius: 22),
        ],
      ),
    );
  }
}

class _SkeletonBox extends StatelessWidget {
  const _SkeletonBox({
    required this.height,
    this.radius = 14,
    this.widthFactor = 1,
  });

  final double height;
  final double radius;
  final double widthFactor;

  @override
  Widget build(BuildContext context) {
    return FractionallySizedBox(
      widthFactor: widthFactor,
      alignment: AlignmentDirectional.centerStart,
      child: Container(
        height: height,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(radius),
        ),
      ),
    );
  }
}
