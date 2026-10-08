import 'package:flutter/material.dart';

import '../../../app/theme/app_theme.dart';
import '../../curriculum/models/curriculum_models.dart';

class LessonScreen extends StatelessWidget {
  const LessonScreen({super.key, required this.lesson});

  final Lesson lesson;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(lesson.title)),
      body: ListView(
        padding: const EdgeInsets.fromLTRB(20, 8, 20, 32),
        children: [
          _HeaderCard(lesson: lesson),
          const SizedBox(height: 16),
          const _SectionCard(
            icon: Icons.lightbulb_outline_rounded,
            title: 'الفكرة الأساسية',
            text:
                'العدد النسبي هو عدد يمكن كتابته على صورة كسر بسطه ومقامه عددان صحيحان، مع كون المقام لا يساوي صفرًا.',
          ),
          const SizedBox(height: 12),
          const _SectionCard(
            icon: Icons.menu_book_rounded,
            title: 'افهم الدرس',
            text:
                'سنبدأ بأمثلة سهلة، ثم نربط العدد النسبي بالكسور والأعداد الصحيحة والتمثيل على خط الأعداد. المحتوى التفصيلي سيُضاف تدريجيًا مع كل درس.',
          ),
          const SizedBox(height: 12),
          const _ExampleCard(),
          const SizedBox(height: 12),
          const _SectionCard(
            icon: Icons.warning_amber_rounded,
            title: 'خطأ شائع',
            text:
                'لا يكفي النظر إلى إشارة العدد فقط عند المقارنة بين الكسور؛ يجب توحيد طريقة المقارنة أو الاستعانة بخط الأعداد.',
          ),
          const SizedBox(height: 20),
          FilledButton.icon(
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('قسم التدريب سيُضاف في المرحلة التالية.'),
                ),
              );
            },
            icon: const Icon(Icons.edit_rounded),
            label: const Padding(
              padding: EdgeInsets.symmetric(vertical: 14),
              child: Text('جرّب بنفسك'),
            ),
          ),
        ],
      ),
    );
  }
}

class _HeaderCard extends StatelessWidget {
  const _HeaderCard({required this.lesson});

  final Lesson lesson;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [AppColors.primary, AppColors.primaryDark],
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
        ),
        borderRadius: BorderRadius.circular(24),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'رياضيات • ثاني متوسط',
            style: TextStyle(color: Colors.white70, fontSize: 13),
          ),
          const SizedBox(height: 8),
          Text(
            lesson.title,
            style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                  color: Colors.white,
                  fontWeight: FontWeight.w800,
                ),
          ),
          const SizedBox(height: 8),
          Text(
            lesson.subtitle,
            style: const TextStyle(color: Colors.white70, height: 1.5),
          ),
        ],
      ),
    );
  }
}

class _SectionCard extends StatelessWidget {
  const _SectionCard({
    required this.icon,
    required this.title,
    required this.text,
  });

  final IconData icon;
  final String title;
  final String text;

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Container(
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: isDark ? AppColors.darkSurface : Colors.white,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: isDark
              ? Colors.white.withValues(alpha: 0.07)
              : const Color(0xFFE5EAE7),
        ),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 42,
            height: 42,
            decoration: BoxDecoration(
              color: colors.primaryContainer,
              borderRadius: BorderRadius.circular(13),
            ),
            child: Icon(icon, color: colors.onPrimaryContainer),
          ),
          const SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.w800,
                        color: colors.onSurface,
                      ),
                ),
                const SizedBox(height: 6),
                Text(
                  text,
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        color: colors.onSurfaceVariant,
                        height: 1.7,
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

class _ExampleCard extends StatelessWidget {
  const _ExampleCard();

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final background =
        isDark ? const Color(0xFF2A251B) : const Color(0xFFFFF8E8);
    final border =
        isDark ? const Color(0xFF4A3D22) : const Color(0xFFF0DDAE);

    return Container(
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: background,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: border),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Icon(Icons.calculate_outlined, color: AppColors.secondary),
              const SizedBox(width: 8),
              Text(
                'مثال سريع',
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.w800,
                      color: colors.onSurface,
                    ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Text(
            'العدد 3/4 عدد نسبي؛ لأنه مكتوب على صورة كسر بسطه ومقامه عددان صحيحان، والمقام لا يساوي صفرًا.',
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: colors.onSurfaceVariant,
                  height: 1.7,
                ),
          ),
        ],
      ),
    );
  }
}
