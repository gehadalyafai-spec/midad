import 'package:flutter/material.dart';

import '../../../app/theme/app_theme.dart';
import '../../../services/progress_service.dart';
import '../../curriculum/models/curriculum_models.dart';
import '../../quizzes/data/rational_numbers_quiz.dart';
import '../../quizzes/screens/quiz_screen.dart';

class LessonScreen extends StatefulWidget {
  const LessonScreen({super.key, required this.lesson});

  final Lesson lesson;

  @override
  State<LessonScreen> createState() => _LessonScreenState();
}

class _LessonScreenState extends State<LessonScreen> {
  final ProgressService _progressService = ProgressService();

  bool _isCompleted = false;

  @override
  void initState() {
    super.initState();
    _loadLessonState();
  }

  Future<void> _loadLessonState() async {
    await _progressService.markLessonStarted(widget.lesson);
    final completed = await _progressService.getCompletedLessonIds();

    if (!mounted) return;
    setState(() => _isCompleted = completed.contains(widget.lesson.id));
  }

  Future<void> _openQuiz() async {
    if (widget.lesson.id != 'rational-numbers-intro') {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('اختبار هذا الدرس سيُضاف قريبًا.')),
      );
      return;
    }

    final passed = await Navigator.of(context).push<bool>(
      MaterialPageRoute<bool>(
        builder: (_) => QuizScreen(
          lesson: widget.lesson,
          questions: rationalNumbersIntroQuiz,
        ),
      ),
    );

    if (passed == true && mounted) {
      setState(() => _isCompleted = true);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.lesson.title)),
      body: ListView(
        padding: const EdgeInsets.fromLTRB(20, 8, 20, 32),
        children: [
          _HeaderCard(
            lesson: widget.lesson,
            isCompleted: _isCompleted,
          ),
          const SizedBox(height: 16),
          const _SectionCard(
            icon: Icons.lightbulb_outline_rounded,
            title: 'الفكرة الأساسية',
            text:
                'العدد النسبي هو أي عدد يمكن كتابته على صورة أ/ب، حيث أ و ب عددان صحيحان، وب لا يساوي صفرًا.',
          ),
          const SizedBox(height: 12),
          const _SectionCard(
            icon: Icons.menu_book_rounded,
            title: 'افهم الدرس',
            text:
                'تشمل الأعداد النسبية الكسور والأعداد الصحيحة وبعض الأعداد العشرية. مثال: 3/4 عدد نسبي، وكذلك -2 لأنه يمكن كتابته على الصورة -2/1.',
          ),
          const SizedBox(height: 12),
          const _ExampleCard(),
          const SizedBox(height: 12),
          const _SectionCard(
            icon: Icons.warning_amber_rounded,
            title: 'خطأ شائع',
            text:
                'لا يمكن أن يكون مقام الكسر صفرًا. لذلك أي تعبير على صورة أ/0 لا يمثل عددًا نسبيًا معرّفًا.',
          ),
          const SizedBox(height: 20),
          FilledButton.icon(
            onPressed: _openQuiz,
            icon: Icon(
              _isCompleted
                  ? Icons.check_circle_rounded
                  : Icons.fact_check_outlined,
            ),
            label: Padding(
              padding: const EdgeInsets.symmetric(vertical: 14),
              child: Text(
                _isCompleted ? 'أعد الاختبار' : 'اختبر نفسك',
                style: const TextStyle(fontWeight: FontWeight.w900),
              ),
            ),
          ),
          if (_isCompleted) ...[
            const SizedBox(height: 12),
            const _CompletedBanner(),
          ],
        ],
      ),
    );
  }
}

class _HeaderCard extends StatelessWidget {
  const _HeaderCard({
    required this.lesson,
    required this.isCompleted,
  });

  final Lesson lesson;
  final bool isCompleted;

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
          Row(
            children: [
              const Expanded(
                child: Text(
                  'رياضيات • ثاني متوسط',
                  style: TextStyle(color: Colors.white70, fontSize: 13),
                ),
              ),
              if (isCompleted)
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 5,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white.withValues(alpha: 0.14),
                    borderRadius: BorderRadius.circular(99),
                  ),
                  child: const Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        Icons.check_circle_rounded,
                        size: 15,
                        color: Colors.white,
                      ),
                      SizedBox(width: 5),
                      Text(
                        'مكتمل',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 11,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                    ],
                  ),
                ),
            ],
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
            'العدد -5 عدد نسبي؛ لأننا نستطيع كتابته على الصورة -5/1. والعدد 0.75 نسبي أيضًا لأنه يساوي 3/4.',
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

class _CompletedBanner extends StatelessWidget {
  const _CompletedBanner();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: Colors.green.withValues(alpha: 0.08),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.green.withValues(alpha: 0.22)),
      ),
      child: const Row(
        children: [
          Icon(Icons.verified_rounded, color: Colors.green),
          SizedBox(width: 10),
          Expanded(
            child: Text(
              'أتممت هذا الدرس بنجاح. يمكنك إعادة الاختبار في أي وقت.',
              style: TextStyle(fontWeight: FontWeight.w700, height: 1.5),
            ),
          ),
        ],
      ),
    );
  }
}
