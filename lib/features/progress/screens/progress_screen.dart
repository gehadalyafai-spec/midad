import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

import '../../../app/theme/app_theme.dart';
import '../../../services/progress_service.dart';
import '../../curriculum/models/curriculum_models.dart';

class ProgressScreen extends StatefulWidget {
  const ProgressScreen({
    super.key,
    required this.chapter,
  });

  final Chapter chapter;

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

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final text = isDark ? AppColors.darkTextPrimary : AppColors.textPrimary;
    final muted =
        isDark ? AppColors.darkTextSecondary : AppColors.textSecondary;
    final surface = isDark ? AppColors.darkSurface : const Color(0xFFFFFDF8);

    final available =
        widget.chapter.lessons.where((lesson) => lesson.isAvailable).toList();
    final completedCount =
        available.where((lesson) => _completed.contains(lesson.id)).length;
    final progress =
        available.isEmpty ? 0.0 : completedCount / available.length;
    final percent = (progress * 100).round();

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
                        'تقدمي',
                        style: TextStyle(
                          color: AppColors.primary,
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 34),
                  _ProgressHero(
                    percent: percent,
                    completed: completedCount,
                    total: available.length,
                  )
                      .animate()
                      .fadeIn(duration: 350.ms)
                      .slideY(begin: 0.08, end: 0),
                  const SizedBox(height: 18),
                  Row(
                    children: [
                      Expanded(
                        child: _StatCard(
                          label: 'دروس مكتملة',
                          value: completedCount.toString(),
                          icon: Icons.check_rounded,
                          accent: AppColors.primary,
                          surface: surface,
                          textColor: text,
                          mutedColor: muted,
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: _StatCard(
                          label: 'للمراجعة',
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
                    'رحلة الفصل',
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
                          color: text,
                          fontWeight: FontWeight.w900,
                        ),
                  ),
                  const SizedBox(height: 6),
                  Text(
                    widget.chapter.title,
                    style: TextStyle(
                      color: muted,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  const SizedBox(height: 18),
                  ...List.generate(widget.chapter.lessons.length, (index) {
                    final lesson = widget.chapter.lessons[index];
                    final completed = _completed.contains(lesson.id);
                    final previousCompleted =
                        index == 0 ||
                        _completed.contains(widget.chapter.lessons[index - 1].id);
                    final unlocked = lesson.isAvailable && previousCompleted;

                    return _ProgressLessonRow(
                      number: index + 1,
                      title: lesson.title,
                      status: completed
                          ? 'مكتمل'
                          : unlocked
                              ? 'جاهز للتعلم'
                              : lesson.isAvailable
                                  ? 'أكمل الدرس السابق أولًا'
                                  : 'قريبًا',
                      completed: completed,
                      unlocked: unlocked,
                      isLast: index == widget.chapter.lessons.length - 1,
                      textColor: text,
                      mutedColor: muted,
                    )
                        .animate(delay: (80 + index * 45).ms)
                        .fadeIn(duration: 300.ms);
                  }),
                ],
              ),
      ),
    );
  }
}

class _ProgressHero extends StatelessWidget {
  const _ProgressHero({
    required this.percent,
    required this.completed,
    required this.total,
  });

  final int percent;
  final int completed;
  final int total;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: AppColors.primaryDark,
        borderRadius: BorderRadius.circular(32),
      ),
      child: Row(
        children: [
          SizedBox(
            width: 106,
            height: 106,
            child: Stack(
              alignment: Alignment.center,
              children: [
                CircularProgressIndicator(
                  value: total == 0 ? 0 : completed / total,
                  strokeWidth: 10,
                  backgroundColor: Colors.white12,
                  valueColor: const AlwaysStoppedAnimation<Color>(
                    AppColors.secondary,
                  ),
                ),
                Text(
                  '$percent%',
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.w900,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 20),
          const Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'كل خطوة محسوبة',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 21,
                    fontWeight: FontWeight.w900,
                  ),
                ),
                SizedBox(height: 8),
                Text(
                  'أكمل الدروس بالترتيب، وارجع لأخطائك حتى ترتفع نسبة إتقانك.',
                  style: TextStyle(
                    color: Colors.white70,
                    height: 1.6,
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

class _StatCard extends StatelessWidget {
  const _StatCard({
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
      height: 132,
      padding: const EdgeInsets.all(17),
      decoration: BoxDecoration(
        color: surface,
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: mutedColor.withValues(alpha: 0.12)),
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
              fontSize: 25,
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

class _ProgressLessonRow extends StatelessWidget {
  const _ProgressLessonRow({
    required this.number,
    required this.title,
    required this.status,
    required this.completed,
    required this.unlocked,
    required this.isLast,
    required this.textColor,
    required this.mutedColor,
  });

  final int number;
  final String title;
  final String status;
  final bool completed;
  final bool unlocked;
  final bool isLast;
  final Color textColor;
  final Color mutedColor;

  @override
  Widget build(BuildContext context) {
    final accent = completed
        ? AppColors.primary
        : unlocked
            ? AppColors.secondary
            : mutedColor.withValues(alpha: 0.35);

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: 50,
          child: Column(
            children: [
              Container(
                width: 38,
                height: 38,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: completed
                      ? AppColors.primary
                      : unlocked
                          ? AppColors.secondary
                          : Colors.transparent,
                  borderRadius: BorderRadius.circular(13),
                  border: Border.all(color: accent),
                ),
                child: completed
                    ? const Icon(
                        Icons.check_rounded,
                        color: Colors.white,
                        size: 18,
                      )
                    : unlocked
                        ? Text(
                            '$number',
                            style: const TextStyle(
                              color: AppColors.primaryDark,
                              fontWeight: FontWeight.w900,
                            ),
                          )
                        : Icon(
                            Icons.lock_outline_rounded,
                            size: 17,
                            color: mutedColor,
                          ),
              ),
              if (!isLast)
                Container(
                  width: 2,
                  height: 54,
                  color: accent.withValues(alpha: 0.32),
                ),
            ],
          ),
        ),
        const SizedBox(width: 10),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(bottom: 22),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    color: completed || unlocked ? textColor : mutedColor,
                    fontWeight: FontWeight.w900,
                  ),
                ),
                const SizedBox(height: 5),
                Text(
                  status,
                  style: TextStyle(
                    color: completed ? AppColors.primary : mutedColor,
                    fontSize: 12,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
