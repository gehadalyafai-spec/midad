import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:shimmer/shimmer.dart';

import '../../app/theme/app_theme.dart';
import '../curriculum/data/grade2_math_data.dart';
import '../curriculum/screens/chapter_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late final Timer _loadingTimer;
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _loadingTimer = Timer(const Duration(milliseconds: 900), () {
      if (mounted) {
        setState(() => _isLoading = false);
      }
    });
  }

  @override
  void dispose() {
    _loadingTimer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final firstChapter = grade2MathChapters.first;
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
            child: Stack(
              clipBehavior: Clip.none,
              children: [
                IconButton.filledTonal(
                  tooltip: 'الإشعارات',
                  onPressed: () => _showComingSoon(context, 'الإشعارات'),
                  icon: const Icon(Icons.notifications_none_rounded),
                ),
                PositionedDirectional(
                  top: 6,
                  end: 6,
                  child: Container(
                    width: 8,
                    height: 8,
                    decoration: BoxDecoration(
                      color: colors.error,
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: Theme.of(context).scaffoldBackgroundColor,
                        width: 1.5,
                      ),
                    ),
                  ),
                ),
              ],
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
                    onContinue: () {
                      Navigator.of(context).push(
                        MaterialPageRoute<void>(
                          builder: (_) => ChapterScreen(chapter: firstChapter),
                        ),
                      );
                    },
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
                    onOpenMath: () {
                      Navigator.of(context).push(
                        MaterialPageRoute<void>(
                          builder: (_) => ChapterScreen(chapter: firstChapter),
                        ),
                      );
                    },
                    onComingSoon: (label) =>
                        _showComingSoon(context, label),
                  ),
                  const SizedBox(height: 26),
                  const _SectionHeader(
                    title: 'تقدمك',
                    subtitle: 'نظرة سريعة على رحلتك الحالية',
                  )
                      .animate(delay: 220.ms)
                      .fadeIn(duration: 380.ms)
                      .slideX(begin: 0.04, end: 0),
                  const SizedBox(height: 14),
                  _ProgressCard(
                    chapterTitle: firstChapter.title,
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
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('$feature سيُضاف قريبًا بإذن الله.')),
    );
  }
}

class _WelcomeCard extends StatelessWidget {
  const _WelcomeCard({
    required this.isDark,
    required this.onContinue,
  });

  final bool isDark;
  final VoidCallback onContinue;

  @override
  Widget build(BuildContext context) {
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
          const Text(
            'مرحبًا بك في مداد',
            style: TextStyle(
              color: Colors.white,
              fontSize: 27,
              fontWeight: FontWeight.w900,
              letterSpacing: -0.5,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            'ابدأ من حيث توقفت، وافهم الدرس خطوة بخطوة ثم اختبر نفسك.',
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
            icon: const Icon(Icons.play_arrow_rounded),
            label: const Text(
              'أكمل التعلّم',
              style: TextStyle(fontWeight: FontWeight.w800),
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
    required this.onOpenMath,
    required this.onComingSoon,
  });

  final VoidCallback onOpenMath;
  final ValueChanged<String> onComingSoon;

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
        subtitle: 'أسئلة قصيرة ومركزة',
        badge: 'قريبًا',
        onTap: () => onComingSoon('الاختبارات'),
      ),
      _LearningTask(
        icon: Icons.replay_rounded,
        title: 'راجع أخطاءك',
        subtitle: 'ارجع للأسئلة التي أخطأت فيها',
        badge: 'قريبًا',
        onTap: () => onComingSoon('مراجعة الأخطاء'),
      ),
      _LearningTask(
        icon: Icons.insights_rounded,
        title: 'تقدمك',
        subtitle: 'تابع نسبة الإتقان',
        badge: 'قريبًا',
        onTap: () => onComingSoon('تفاصيل التقدم'),
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
  const _ProgressCard({required this.chapterTitle});

  final String chapterTitle;

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    final isDark = Theme.of(context).brightness == Brightness.dark;

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
                  value: 0.32,
                  strokeWidth: 7,
                  strokeCap: StrokeCap.round,
                  backgroundColor: colors.surfaceContainerHighest,
                  color: colors.primary,
                ),
                Text(
                  '32%',
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
                const SizedBox(height: 6),
                Text(
                  'أكمل الدروس والتدريبات لرفع نسبة إتقانك.',
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        color: colors.onSurfaceVariant,
                        height: 1.5,
                      ),
                ),
              ],
            ),
          ),
          Icon(
            Icons.arrow_back_ios_new_rounded,
            size: 16,
            color: colors.onSurfaceVariant,
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
