import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

import '../../../app/theme/app_theme.dart';
import '../../curriculum/data/grade2_math_data.dart';

class CourseCompleteScreen extends StatelessWidget {
  const CourseCompleteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final totalLessons = grade2MathChapters
        .expand((chapter) => chapter.lessons)
        .where((lesson) => lesson.isAvailable)
        .length;

    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Positioned.fill(
              child: CustomPaint(
                painter: _CelebrationPainter(
                  color: AppColors.primary.withValues(alpha: 0.06),
                ),
              ),
            ),
            Center(
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(24),
                child: Column(
                  children: [
                    Container(
                      width: 132,
                      height: 132,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: AppColors.secondary,
                        borderRadius: BorderRadius.circular(42),
                      ),
                      child: const Icon(
                        Icons.workspace_premium_rounded,
                        size: 62,
                        color: AppColors.primaryDark,
                      ),
                    )
                        .animate()
                        .scale(
                          begin: const Offset(0.78, 0.78),
                          end: const Offset(1, 1),
                          duration: 520.ms,
                          curve: Curves.easeOutBack,
                        )
                        .fadeIn(),
                    const SizedBox(height: 30),
                    Text(
                      'أكملت رياضيات\nثاني متوسط',
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.displaySmall?.copyWith(
                            fontWeight: FontWeight.w900,
                            height: 1.08,
                            letterSpacing: -1.0,
                          ),
                    )
                        .animate(delay: 100.ms)
                        .fadeIn(duration: 360.ms)
                        .slideY(begin: 0.08, end: 0),
                    const SizedBox(height: 12),
                    Text(
                      'أنهيت جميع الدروس والاختبارات في المسار الحالي.',
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                            color: Theme.of(context)
                                .colorScheme
                                .onSurfaceVariant,
                            height: 1.6,
                          ),
                    ),
                    const SizedBox(height: 30),
                    Container(
                      padding: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        color: AppColors.primaryDark,
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: Row(
                        children: [
                          const Expanded(
                            child: _FinishMetric(
                              value: '100%',
                              label: 'إتقان المادة',
                            ),
                          ),
                          Container(
                            width: 1,
                            height: 54,
                            color: Colors.white12,
                          ),
                          Expanded(
                            child: _FinishMetric(
                              value: '${grade2MathChapters.length}',
                              label: 'فصول',
                            ),
                          ),
                          Container(
                            width: 1,
                            height: 54,
                            color: Colors.white12,
                          ),
                          Expanded(
                            child: _FinishMetric(
                              value: '$totalLessons',
                              label: 'دروس',
                            ),
                          ),
                        ],
                      ),
                    ).animate(delay: 170.ms).fadeIn(duration: 360.ms),
                    const SizedBox(height: 30),
                    SizedBox(
                      width: double.infinity,
                      child: FilledButton.icon(
                        onPressed: () {
                          Navigator.of(context).popUntil(
                            (route) => route.isFirst,
                          );
                        },
                        style: FilledButton.styleFrom(
                          backgroundColor: AppColors.primary,
                          foregroundColor: Colors.white,
                          minimumSize: const Size.fromHeight(58),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                        icon: const Icon(Icons.home_rounded),
                        label: const Text(
                          'العودة للرئيسية',
                          style: TextStyle(
                            fontWeight: FontWeight.w900,
                            fontSize: 15,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _FinishMetric extends StatelessWidget {
  const _FinishMetric({
    required this.value,
    required this.label,
  });

  final String value;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          value,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 21,
            fontWeight: FontWeight.w900,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          label,
          textAlign: TextAlign.center,
          style: const TextStyle(
            color: Colors.white60,
            fontSize: 10,
            fontWeight: FontWeight.w700,
          ),
        ),
      ],
    );
  }
}

class _CelebrationPainter extends CustomPainter {
  const _CelebrationPainter({required this.color});

  final Color color;

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()..color = color;

    const spacing = 44.0;
    for (double y = 18; y < size.height; y += spacing) {
      for (double x = 18; x < size.width; x += spacing) {
        canvas.drawCircle(Offset(x, y), 2.2, paint);
      }
    }
  }

  @override
  bool shouldRepaint(covariant _CelebrationPainter oldDelegate) {
    return oldDelegate.color != color;
  }
}
