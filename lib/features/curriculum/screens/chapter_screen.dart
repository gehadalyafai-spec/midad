import 'package:flutter/material.dart';

import '../../../app/theme/app_theme.dart';
import '../../lessons/screens/lesson_screen.dart';
import '../models/curriculum_models.dart';

class ChapterScreen extends StatelessWidget {
  const ChapterScreen({super.key, required this.chapter});

  final Chapter chapter;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('رياضيات ثاني متوسط')),
      body: ListView(
        padding: const EdgeInsets.fromLTRB(20, 8, 20, 32),
        children: [
          Text(
            chapter.title,
            style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                  fontWeight: FontWeight.w900,
                  color: AppColors.textPrimary,
                ),
          ),
          const SizedBox(height: 6),
          Text(
            chapter.subtitle,
            style: const TextStyle(
              color: AppColors.textSecondary,
              height: 1.6,
            ),
          ),
          const SizedBox(height: 22),
          ...List.generate(chapter.lessons.length, (index) {
            final lesson = chapter.lessons[index];
            return Padding(
              padding: const EdgeInsets.only(bottom: 12),
              child: _LessonTile(
                number: index + 1,
                lesson: lesson,
                onTap: lesson.isAvailable
                    ? () {
                        Navigator.of(context).push(
                          MaterialPageRoute<void>(
                            builder: (_) => LessonScreen(lesson: lesson),
                          ),
                        );
                      }
                    : null,
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
    required this.onTap,
  });

  final int number;
  final Lesson lesson;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final enabled = onTap != null;

    return Material(
      color: Colors.white,
      borderRadius: BorderRadius.circular(18),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(18),
        child: Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(18),
            border: Border.all(color: const Color(0xFFE5EAE7)),
          ),
          child: Row(
            children: [
              Container(
                width: 44,
                height: 44,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: enabled
                      ? AppColors.surfaceSoft
                      : const Color(0xFFF1F2F1),
                  borderRadius: BorderRadius.circular(14),
                ),
                child: enabled
                    ? Text(
                        '$number',
                        style: const TextStyle(
                          color: AppColors.primary,
                          fontWeight: FontWeight.w900,
                        ),
                      )
                    : const Icon(Icons.lock_outline_rounded, size: 20),
              ),
              const SizedBox(width: 14),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      lesson.title,
                      style: TextStyle(
                        fontWeight: FontWeight.w800,
                        color: enabled
                            ? AppColors.textPrimary
                            : AppColors.textSecondary,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      enabled ? lesson.subtitle : 'سيُضاف قريبًا',
                      style: const TextStyle(
                        color: AppColors.textSecondary,
                        fontSize: 13,
                      ),
                    ),
                  ],
                ),
              ),
              if (enabled)
                const Icon(
                  Icons.arrow_back_ios_new_rounded,
                  size: 16,
                  color: AppColors.primary,
                ),
            ],
          ),
        ),
      ),
    );
  }
}
