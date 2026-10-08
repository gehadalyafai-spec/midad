import 'package:flutter/material.dart';

import '../../../app/theme/app_theme.dart';
import '../../../services/progress_service.dart';
import '../../lessons/screens/lesson_screen.dart';
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

  @override
  void initState() {
    super.initState();
    _loadProgress();
  }

  Future<void> _loadProgress() async {
    final completed = await _progressService.getCompletedLessonIds();
    if (!mounted) return;
    setState(() => _completedLessonIds = completed);
  }

  Future<void> _openLesson(Lesson lesson) async {
    await Navigator.of(context).push(
      MaterialPageRoute<void>(
        builder: (_) => LessonScreen(lesson: lesson),
      ),
    );
    await _loadProgress();
  }

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return Scaffold(
      appBar: AppBar(title: const Text('رياضيات ثاني متوسط')),
      body: ListView(
        padding: const EdgeInsets.fromLTRB(20, 8, 20, 32),
        children: [
          Text(
            widget.chapter.title,
            style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                  fontWeight: FontWeight.w900,
                  color: colors.onSurface,
                ),
          ),
          const SizedBox(height: 6),
          Text(
            widget.chapter.subtitle,
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: colors.onSurfaceVariant,
                  height: 1.6,
                ),
          ),
          const SizedBox(height: 22),
          ...List.generate(widget.chapter.lessons.length, (index) {
            final lesson = widget.chapter.lessons[index];
            return Padding(
              padding: const EdgeInsets.only(bottom: 12),
              child: _LessonTile(
                number: index + 1,
                lesson: lesson,
                completed: _completedLessonIds.contains(lesson.id),
                onTap: lesson.isAvailable ? () => _openLesson(lesson) : null,
              ),
            );
          }),
        ],
      ),
    );
  }
}

class _LessonTile extends StatelessWidget {
  const _LessonTile({
    required this.number,
    required this.lesson,
    required this.completed,
    required this.onTap,
  });

  final int number;
  final Lesson lesson;
  final bool completed;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final enabled = onTap != null;
    final colors = Theme.of(context).colorScheme;
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Material(
      color: isDark ? AppColors.darkSurface : Colors.white,
      borderRadius: BorderRadius.circular(18),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(18),
        child: Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(18),
            border: Border.all(
              color: completed
                  ? Colors.green.withValues(alpha: 0.35)
                  : (isDark
                      ? Colors.white.withValues(alpha: 0.07)
                      : const Color(0xFFE5EAE7)),
            ),
          ),
          child: Row(
            children: [
              Container(
                width: 44,
                height: 44,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: completed
                      ? Colors.green.withValues(alpha: 0.12)
                      : (enabled
                          ? colors.primaryContainer
                          : colors.surfaceContainerHighest),
                  borderRadius: BorderRadius.circular(14),
                ),
                child: completed
                    ? const Icon(
                        Icons.check_rounded,
                        color: Colors.green,
                        size: 22,
                      )
                    : (enabled
                        ? Text(
                            '$number',
                            style: TextStyle(
                              color: colors.onPrimaryContainer,
                              fontWeight: FontWeight.w900,
                            ),
                          )
                        : Icon(
                            Icons.lock_outline_rounded,
                            size: 20,
                            color: colors.onSurfaceVariant,
                          )),
              ),
              const SizedBox(width: 14),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      lesson.title,
                      style: Theme.of(context).textTheme.titleSmall?.copyWith(
                            fontWeight: FontWeight.w800,
                            color: enabled
                                ? colors.onSurface
                                : colors.onSurfaceVariant,
                          ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      completed
                          ? 'تم إكمال الدرس'
                          : (enabled ? lesson.subtitle : 'سيُضاف قريبًا'),
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                            color: completed
                                ? Colors.green
                                : colors.onSurfaceVariant,
                          ),
                    ),
                  ],
                ),
              ),
              if (enabled)
                Icon(
                  Icons.arrow_back_ios_new_rounded,
                  size: 16,
                  color: completed ? Colors.green : colors.primary,
                ),
            ],
          ),
        ),
      ),
    );
  }
}
