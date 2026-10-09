import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

import '../../../app/theme/app_theme.dart';
import '../../../services/progress_service.dart';
import '../../curriculum/data/grade2_math_data.dart';
import '../../curriculum/models/curriculum_models.dart';
import '../../quizzes/data/grade2_math_quiz_registry.dart';
import '../../quizzes/screens/quiz_screen.dart';
import '../../progress/screens/course_complete_screen.dart';
import '../data/grade2_math_lesson_registry.dart';
import '../widgets/lesson_visual_aid.dart';

class LessonScreen extends StatefulWidget {
  const LessonScreen({super.key, required this.lesson});

  final Lesson lesson;

  @override
  State<LessonScreen> createState() => _LessonScreenState();
}

class _LessonScreenState extends State<LessonScreen> {
  final ProgressService _progressService = ProgressService();

  bool _isCompleted = false;
  int? _practiceSelected;
  bool _practiceChecked = false;

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
    final passed = await Navigator.of(context).push<bool>(
      MaterialPageRoute<bool>(
        builder: (_) => QuizScreen(
          lesson: widget.lesson,
          questions: quizForGrade2MathLesson(widget.lesson.id),
        ),
      ),
    );

    if (passed == true && mounted) {
      setState(() => _isCompleted = true);
    }
  }

  void _selectPractice(int index) {
    if (_practiceChecked) return;
    setState(() => _practiceSelected = index);
  }

  void _checkPractice() {
    if (_practiceSelected == null) return;
    setState(() => _practiceChecked = true);
  }

  void _resetPractice() {
    setState(() {
      _practiceSelected = null;
      _practiceChecked = false;
    });
  }

  Lesson? _nextLessonInCourse() {
    for (var chapterIndex = 0;
        chapterIndex < grade2MathChapters.length;
        chapterIndex++) {
      final lessons = grade2MathChapters[chapterIndex]
          .lessons
          .where((lesson) => lesson.isAvailable)
          .toList();

      final lessonIndex =
          lessons.indexWhere((lesson) => lesson.id == widget.lesson.id);

      if (lessonIndex == -1) continue;

      if (lessonIndex < lessons.length - 1) {
        return lessons[lessonIndex + 1];
      }

      if (chapterIndex < grade2MathChapters.length - 1) {
        final nextChapterLessons = grade2MathChapters[chapterIndex + 1]
            .lessons
            .where((lesson) => lesson.isAvailable)
            .toList();

        if (nextChapterLessons.isNotEmpty) {
          return nextChapterLessons.first;
        }
      }
    }

    return null;
  }

  Future<void> _openNextLesson() async {
    final nextLesson = _nextLessonInCourse();
    if (nextLesson == null) {
      await Navigator.of(context).pushReplacement(
        MaterialPageRoute<void>(
          builder: (_) => const CourseCompleteScreen(),
        ),
      );
      return;
    }

    await Navigator.of(context).pushReplacement(
      MaterialPageRoute<void>(
        builder: (_) => LessonScreen(lesson: nextLesson),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final lessonData = lessonContentForGrade2Math(widget.lesson.id);
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final text = isDark ? AppColors.darkTextPrimary : AppColors.textPrimary;
    final muted =
        isDark ? AppColors.darkTextSecondary : AppColors.textSecondary;
    final paper = isDark ? AppColors.darkSurface : const Color(0xFFFFFDF8);
    final nextLesson = _nextLessonInCourse();

    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Positioned.fill(
              child: CustomPaint(
                painter: _NotebookLinesPainter(
                  lineColor: isDark
                      ? Colors.white.withValues(alpha: 0.035)
                      : AppColors.primary.withValues(alpha: 0.045),
                  marginColor: AppColors.accent.withValues(alpha: 0.13),
                ),
              ),
            ),
            ListView(
              padding: const EdgeInsets.fromLTRB(22, 18, 22, 126),
              children: [
                Row(
                  children: [
                    _RoundBackButton(
                      paper: paper,
                      color: text,
                      onTap: () => Navigator.of(context).pop(),
                    ),
                    const Spacer(),
                    if (_isCompleted)
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 12,
                          vertical: 8,
                        ),
                        decoration: BoxDecoration(
                          color: AppColors.primary,
                          borderRadius: BorderRadius.circular(999),
                        ),
                        child: const Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(
                              Icons.check_rounded,
                              size: 16,
                              color: Colors.white,
                            ),
                            SizedBox(width: 5),
                            Text(
                              'مكتمل',
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w900,
                                fontSize: 11,
                              ),
                            ),
                          ],
                        ),
                      ),
                  ],
                ),
                const SizedBox(height: 32),
                const Text(
                  'درس اليوم',
                  style: TextStyle(
                    color: AppColors.accent,
                    fontWeight: FontWeight.w900,
                    fontSize: 13,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  widget.lesson.title,
                  style: Theme.of(context).textTheme.displaySmall?.copyWith(
                        color: text,
                        fontWeight: FontWeight.w900,
                        height: 1.04,
                        letterSpacing: -1.1,
                      ),
                )
                    .animate()
                    .fadeIn(duration: 350.ms)
                    .slideY(begin: 0.08, end: 0),
                const SizedBox(height: 10),
                Text(
                  widget.lesson.subtitle,
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        color: muted,
                        height: 1.6,
                      ),
                ),
                const SizedBox(height: 20),
                _LessonRoadmap(
                  paper: paper,
                  textColor: text,
                  mutedColor: muted,
                ).animate(delay: 45.ms).fadeIn(duration: 320.ms),
                const SizedBox(height: 28),
                _ConceptBoard(
                  label: lessonData.conceptLabel,
                  main: lessonData.conceptMain,
                  hint: lessonData.conceptHint,
                )
                    .animate(delay: 80.ms)
                    .fadeIn(duration: 360.ms),
                if (lessonData.hasExtendedExplanation) ...[
                  const SizedBox(height: 26),
                  _TeachingIntro(
                    intro: lessonData.intro,
                    whyItMatters: lessonData.whyItMatters,
                    paper: paper,
                    textColor: text,
                    mutedColor: muted,
                  ).animate(delay: 105.ms).fadeIn(),
                ],
                const SizedBox(height: 22),
                LessonVisualAid(
                  lessonId: widget.lesson.id,
                  steps: lessonData.steps,
                ).animate(delay: 112.ms).fadeIn(duration: 360.ms),
                const SizedBox(height: 30),
                _LessonSection(
                  number: '01',
                  title: lessonData.sectionOneTitle,
                  text: lessonData.sectionOneBody,
                  accent: AppColors.primary,
                  textColor: text,
                  mutedColor: muted,
                ).animate(delay: 120.ms).fadeIn(),
                const SizedBox(height: 26),
                _LessonSection(
                  number: '02',
                  title: lessonData.sectionTwoTitle,
                  text: lessonData.sectionTwoBody,
                  accent: AppColors.secondary,
                  textColor: text,
                  mutedColor: muted,
                ).animate(delay: 170.ms).fadeIn(),
                if (lessonData.steps.isNotEmpty) ...[
                  const SizedBox(height: 24),
                  _StepsCard(
                    steps: lessonData.steps,
                    paper: paper,
                    textColor: text,
                    mutedColor: muted,
                  ).animate(delay: 195.ms).fadeIn(),
                ],
                const SizedBox(height: 26),
                _WorkedExample(
                  formula: lessonData.exampleFormula,
                  body: lessonData.exampleBody,
                ).animate(delay: 210.ms).fadeIn(),
                if (lessonData.secondExampleFormula.isNotEmpty ||
                    lessonData.secondExampleBody.isNotEmpty) ...[
                  const SizedBox(height: 18),
                  _WorkedExample(
                    title: 'مثال إضافي',
                    formula: lessonData.secondExampleFormula,
                    body: lessonData.secondExampleBody,
                  ).animate(delay: 225.ms).fadeIn(),
                ],
                const SizedBox(height: 22),
                _QuickPractice(
                  question: lessonData.practiceQuestion,
                  options: lessonData.practiceOptions,
                  correctIndex: lessonData.practiceCorrectIndex,
                  feedback: lessonData.practiceFeedback,
                  reviewHint: lessonData.warning,
                  reviewStep: lessonData.steps.isNotEmpty
                      ? lessonData.steps.first
                      : lessonData.sectionTwoBody,
                  selectedIndex: _practiceSelected,
                  checked: _practiceChecked,
                  paper: paper,
                  textColor: text,
                  mutedColor: muted,
                  onSelect: _selectPractice,
                  onCheck: _checkPractice,
                  onRetry: _resetPractice,
                ).animate(delay: 240.ms).fadeIn(),
                const SizedBox(height: 18),
                _WarningNote(
                  warning: lessonData.warning,
                  textColor: text,
                  mutedColor: muted,
                ).animate(delay: 270.ms).fadeIn(),
                if (lessonData.summaryPoints.isNotEmpty) ...[
                  const SizedBox(height: 18),
                  _SummaryCard(
                    points: lessonData.summaryPoints,
                    paper: paper,
                    textColor: text,
                  ).animate(delay: 290.ms).fadeIn(),
                ],
                if (!_isCompleted && lessonData.summaryPoints.isNotEmpty) ...[
                  const SizedBox(height: 18),
                  _ReadyForQuizCard(
                    points: lessonData.summaryPoints,
                    paper: paper,
                    textColor: text,
                    mutedColor: muted,
                  ).animate(delay: 310.ms).fadeIn(),
                ],
                if (_isCompleted) ...[
                  const SizedBox(height: 18),
                  _CompletedNote(
                    paper: paper,
                    textColor: text,
                  ),
                ],
              ],
            ),
            Positioned(
              left: 22,
              right: 22,
              bottom: 18,
              child: _LessonActionBar(
                completed: _isCompleted,
                hasNextLesson: nextLesson != null,
                onQuiz: _openQuiz,
                onNext: _openNextLesson,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _LessonRoadmap extends StatelessWidget {
  const _LessonRoadmap({
    required this.paper,
    required this.textColor,
    required this.mutedColor,
  });

  final Color paper;
  final Color textColor;
  final Color mutedColor;

  static const _stages = <({IconData icon, String label})>[
    (icon: Icons.lightbulb_outline_rounded, label: 'افهم'),
    (icon: Icons.visibility_rounded, label: 'شاهد'),
    (icon: Icons.format_list_numbered_rounded, label: 'طبّق'),
    (icon: Icons.edit_rounded, label: 'جرّب'),
    (icon: Icons.bolt_rounded, label: 'اختبر'),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(14, 14, 14, 12),
      decoration: BoxDecoration(
        color: paper,
        borderRadius: BorderRadius.circular(22),
        border: Border.all(
          color: AppColors.primary.withValues(alpha: 0.12),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'خارطة الدرس',
            style: TextStyle(
              color: textColor,
              fontWeight: FontWeight.w900,
              fontSize: 13,
            ),
          ),
          const SizedBox(height: 12),
          Row(
            children: List.generate(_stages.length, (index) {
              final stage = _stages[index];
              return Expanded(
                child: Row(
                  children: [
                    Expanded(
                      child: Column(
                        children: [
                          Container(
                            width: 34,
                            height: 34,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              color: index == 0
                                  ? AppColors.primary
                                  : AppColors.primary.withValues(alpha: 0.08),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Icon(
                              stage.icon,
                              size: 17,
                              color: index == 0
                                  ? Colors.white
                                  : AppColors.primary,
                            ),
                          ),
                          const SizedBox(height: 6),
                          Text(
                            stage.label,
                            style: TextStyle(
                              color: index == 0 ? textColor : mutedColor,
                              fontSize: 10,
                              fontWeight: FontWeight.w800,
                            ),
                          ),
                        ],
                      ),
                    ),
                    if (index != _stages.length - 1)
                      Container(
                        width: 10,
                        height: 1.5,
                        color: mutedColor.withValues(alpha: 0.18),
                      ),
                  ],
                ),
              );
            }),
          ),
        ],
      ),
    );
  }
}

class _RoundBackButton extends StatelessWidget {
  const _RoundBackButton({
    required this.paper,
    required this.color,
    required this.onTap,
  });

  final Color paper;
  final Color color;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: paper,
      borderRadius: BorderRadius.circular(14),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(14),
        child: SizedBox(
          width: 46,
          height: 46,
          child: Icon(Icons.arrow_forward_rounded, color: color),
        ),
      ),
    );
  }
}

class _ConceptBoard extends StatelessWidget {
  const _ConceptBoard({
    required this.label,
    required this.main,
    required this.hint,
  });

  final String label;
  final String main;
  final String hint;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(22),
      decoration: BoxDecoration(
        color: AppColors.primaryDark,
        borderRadius: BorderRadius.circular(30),
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  label,
                  style: const TextStyle(
                    color: Colors.white60,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  main,
                  textDirection: TextDirection.rtl,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 34,
                    fontWeight: FontWeight.w900,
                    height: 1.15,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  hint,
                  style: const TextStyle(
                    color: AppColors.secondary,
                    fontSize: 16,
                    fontWeight: FontWeight.w900,
                  ),
                ),
              ],
            ),
          ),
          Container(
            width: 92,
            height: 92,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: AppColors.secondary,
              borderRadius: BorderRadius.circular(28),
            ),
            child: const Icon(
              Icons.functions_rounded,
              color: AppColors.primaryDark,
              size: 42,
            ),
          ),
        ],
      ),
    );
  }
}

class _LessonSection extends StatelessWidget {
  const _LessonSection({
    required this.number,
    required this.title,
    required this.text,
    required this.accent,
    required this.textColor,
    required this.mutedColor,
  });

  final String number;
  final String title;
  final String text;
  final Color accent;
  final Color textColor;
  final Color mutedColor;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          number,
          style: TextStyle(
            color: accent,
            fontWeight: FontWeight.w900,
            fontSize: 13,
          ),
        ),
        const SizedBox(width: 14),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      color: textColor,
                      fontWeight: FontWeight.w900,
                    ),
              ),
              const SizedBox(height: 8),
              Text(
                text,
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      color: mutedColor,
                      height: 1.75,
                    ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _TeachingIntro extends StatelessWidget {
  const _TeachingIntro({
    required this.intro,
    required this.whyItMatters,
    required this.paper,
    required this.textColor,
    required this.mutedColor,
  });

  final String intro;
  final String whyItMatters;
  final Color paper;
  final Color textColor;
  final Color mutedColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: paper,
        borderRadius: BorderRadius.circular(26),
        border: Border.all(
          color: AppColors.primary.withValues(alpha: 0.14),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (intro.isNotEmpty) ...[
            const Text(
              'افهمها ببساطة',
              style: TextStyle(
                color: AppColors.primary,
                fontWeight: FontWeight.w900,
                fontSize: 16,
              ),
            ),
            const SizedBox(height: 9),
            Text(
              intro,
              style: TextStyle(
                color: textColor,
                height: 1.85,
                fontSize: 15,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
          if (intro.isNotEmpty && whyItMatters.isNotEmpty)
            const SizedBox(height: 18),
          if (whyItMatters.isNotEmpty) ...[
            Row(
              children: [
                const Icon(
                  Icons.lightbulb_outline_rounded,
                  color: AppColors.secondary,
                  size: 20,
                ),
                const SizedBox(width: 7),
                Text(
                  'لماذا نحتاج هذه الفكرة؟',
                  style: TextStyle(
                    color: textColor,
                    fontWeight: FontWeight.w900,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Text(
              whyItMatters,
              style: TextStyle(
                color: mutedColor,
                height: 1.8,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ],
      ),
    );
  }
}

class _StepsCard extends StatelessWidget {
  const _StepsCard({
    required this.steps,
    required this.paper,
    required this.textColor,
    required this.mutedColor,
  });

  final List<String> steps;
  final Color paper;
  final Color textColor;
  final Color mutedColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: paper,
        borderRadius: BorderRadius.circular(26),
        border: Border.all(
          color: AppColors.secondary.withValues(alpha: 0.25),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'امشِ على هذه الخطوات',
            style: TextStyle(
              color: AppColors.primary,
              fontSize: 16,
              fontWeight: FontWeight.w900,
            ),
          ),
          const SizedBox(height: 14),
          ...List.generate(steps.length, (index) {
            return Padding(
              padding: const EdgeInsets.only(bottom: 12),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: 30,
                    height: 30,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: AppColors.primaryDark,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Text(
                      '${index + 1}',
                      style: const TextStyle(
                        color: AppColors.secondary,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                  ),
                  const SizedBox(width: 11),
                  Expanded(
                    child: Text(
                      steps[index],
                      style: TextStyle(
                        color: textColor,
                        height: 1.65,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ],
              ),
            );
          }),
        ],
      ),
    );
  }
}

class _SummaryCard extends StatelessWidget {
  const _SummaryCard({
    required this.points,
    required this.paper,
    required this.textColor,
  });

  final List<String> points;
  final Color paper;
  final Color textColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: paper,
        borderRadius: BorderRadius.circular(26),
        border: Border.all(
          color: AppColors.primary.withValues(alpha: 0.18),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'خلاصة الدرس في دقيقة',
            style: TextStyle(
              color: AppColors.primary,
              fontSize: 16,
              fontWeight: FontWeight.w900,
            ),
          ),
          const SizedBox(height: 12),
          ...points.map(
            (point) => Padding(
              padding: const EdgeInsets.only(bottom: 9),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Icon(
                    Icons.check_circle_outline_rounded,
                    size: 19,
                    color: AppColors.primary,
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Text(
                      point,
                      style: TextStyle(
                        color: textColor,
                        height: 1.55,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _WorkedExample extends StatelessWidget {
  const _WorkedExample({
    this.title = 'مثال محلول',
    required this.formula,
    required this.body,
  });

  final String title;
  final String formula;
  final String body;

  TextDirection _directionFor(String value) {
    final hasArabic = RegExp(r'[\u0600-\u06FF]').hasMatch(value);
    return hasArabic ? TextDirection.rtl : TextDirection.ltr;
  }

  @override
  Widget build(BuildContext context) {
    final formulaParts = formula
        .split('=')
        .map((part) => part.trim())
        .where((part) => part.isNotEmpty)
        .toList();
    final hasResult = formulaParts.length > 1;
    final result = hasResult ? formulaParts.last : '';
    final statement = hasResult
        ? formulaParts.sublist(0, formulaParts.length - 1).join(' = ')
        : formula.trim();

    final bodySteps = body
        .replaceAll('؛', '.')
        .split(RegExp(r'[.!؟]\s*'))
        .map((step) => step.trim())
        .where((step) => step.isNotEmpty)
        .toList();

    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: AppColors.secondary,
        borderRadius: BorderRadius.circular(28),
      ),
      child: Directionality(
        textDirection: TextDirection.rtl,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              children: [
                const Icon(
                  Icons.auto_awesome_rounded,
                  color: AppColors.primaryDark,
                ),
                const SizedBox(width: 8),
                Text(
                  title,
                  style: const TextStyle(
                    color: AppColors.primaryDark,
                    fontWeight: FontWeight.w900,
                    fontSize: 17,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 18),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 14,
              ),
              decoration: BoxDecoration(
                color: Colors.white.withValues(alpha: 0.30),
                borderRadius: BorderRadius.circular(18),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const Text(
                    'المثال',
                    textAlign: TextAlign.right,
                    style: TextStyle(
                      color: AppColors.primaryDark,
                      fontSize: 11,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                  const SizedBox(height: 7),
                  Directionality(
                    textDirection: _directionFor(statement),
                    child: Text(
                      statement,
                      textAlign: _directionFor(statement) == TextDirection.rtl
                          ? TextAlign.right
                          : TextAlign.left,
                      style: const TextStyle(
                        color: AppColors.primaryDark,
                        fontWeight: FontWeight.w900,
                        fontSize: 23,
                        height: 1.4,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 14),
            const Text(
              'فكّر معي خطوة بخطوة',
              textAlign: TextAlign.right,
              style: TextStyle(
                color: AppColors.primaryDark,
                fontWeight: FontWeight.w900,
                fontSize: 13,
              ),
            ),
            const SizedBox(height: 9),
            if (bodySteps.length <= 1)
              Text(
                body,
                textAlign: TextAlign.right,
                textDirection: TextDirection.rtl,
                style: const TextStyle(
                  color: AppColors.primaryDark,
                  height: 1.75,
                  fontWeight: FontWeight.w700,
                  fontSize: 14,
                ),
              )
            else
              ...List.generate(bodySteps.length, (index) {
                return Padding(
                  padding: const EdgeInsets.only(bottom: 9),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: 28,
                        height: 28,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: AppColors.primaryDark,
                          borderRadius: BorderRadius.circular(9),
                        ),
                        child: Text(
                          '${index + 1}',
                          style: const TextStyle(
                            color: AppColors.secondary,
                            fontSize: 11,
                            fontWeight: FontWeight.w900,
                          ),
                        ),
                      ),
                      const SizedBox(width: 9),
                      Expanded(
                        child: Text(
                          bodySteps[index],
                          textAlign: TextAlign.right,
                          textDirection: TextDirection.rtl,
                          style: const TextStyle(
                            color: AppColors.primaryDark,
                            height: 1.65,
                            fontWeight: FontWeight.w700,
                            fontSize: 14,
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              }),
            if (hasResult) ...[
              const SizedBox(height: 14),
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 12,
                ),
                decoration: BoxDecoration(
                  color: AppColors.primaryDark,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Row(
                  children: [
                    const Text(
                      'النتيجة النهائية',
                      style: TextStyle(
                        color: AppColors.secondary,
                        fontWeight: FontWeight.w900,
                        fontSize: 12,
                      ),
                    ),
                    const Spacer(),
                    Flexible(
                      child: Directionality(
                        textDirection: _directionFor(result),
                        child: Text(
                          result,
                          textAlign: _directionFor(result) == TextDirection.rtl
                              ? TextAlign.right
                              : TextAlign.left,
                          style: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w900,
                            fontSize: 20,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}

class _QuickPractice extends StatelessWidget {
  const _QuickPractice({
    required this.question,
    required this.options,
    required this.correctIndex,
    required this.feedback,
    required this.reviewHint,
    required this.reviewStep,
    required this.selectedIndex,
    required this.checked,
    required this.paper,
    required this.textColor,
    required this.mutedColor,
    required this.onSelect,
    required this.onCheck,
    required this.onRetry,
  });

  final String question;
  final List<String> options;
  final int correctIndex;
  final String feedback;
  final String reviewHint;
  final String reviewStep;
  final int? selectedIndex;
  final bool checked;
  final Color paper;
  final Color textColor;
  final Color mutedColor;
  final ValueChanged<int> onSelect;
  final VoidCallback onCheck;
  final VoidCallback onRetry;

  @override
  Widget build(BuildContext context) {
    final correct = checked && selectedIndex == correctIndex;

    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: paper,
        borderRadius: BorderRadius.circular(26),
        border: Border.all(
          color: AppColors.primary.withValues(alpha: 0.15),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Row(
            children: [
              Icon(Icons.edit_rounded, color: AppColors.primary),
              SizedBox(width: 8),
              Text(
                'جرّب بنفسك',
                style: TextStyle(
                  color: AppColors.primary,
                  fontWeight: FontWeight.w900,
                ),
              ),
            ],
          ),
          const SizedBox(height: 14),
          Text(
            question,
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  color: textColor,
                  fontWeight: FontWeight.w900,
                  height: 1.5,
                ),
          ),
          const SizedBox(height: 14),
          ...List.generate(options.length, (index) {
            final selected = selectedIndex == index;
            final isCorrectOption = checked && index == correctIndex;
            final wrongSelection = checked && selected && index != correctIndex;

            Color background = Colors.transparent;
            Color border = mutedColor.withValues(alpha: 0.16);

            if (isCorrectOption) {
              background = AppColors.primary.withValues(alpha: 0.10);
              border = AppColors.primary;
            } else if (wrongSelection) {
              background = AppColors.accent.withValues(alpha: 0.10);
              border = AppColors.accent;
            } else if (selected) {
              background = AppColors.secondary.withValues(alpha: 0.22);
              border = AppColors.secondary;
            }

            return Padding(
              padding: const EdgeInsets.only(bottom: 9),
              child: Material(
                color: Colors.transparent,
                child: InkWell(
                  onTap: checked ? null : () => onSelect(index),
                  borderRadius: BorderRadius.circular(16),
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 170),
                    width: double.infinity,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 14,
                      vertical: 13,
                    ),
                    decoration: BoxDecoration(
                      color: background,
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(color: border),
                    ),
                    child: Row(
                      children: [
                        Expanded(
                          child: Text(
                            options[index],
                            style: TextStyle(
                              color: textColor,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                        if (isCorrectOption)
                          const Icon(
                            Icons.check_circle_rounded,
                            color: AppColors.primary,
                          ),
                        if (wrongSelection)
                          const Icon(
                            Icons.cancel_rounded,
                            color: AppColors.accent,
                          ),
                      ],
                    ),
                  ),
                ),
              ),
            );
          }),
          const SizedBox(height: 4),
          if (!checked)
            SizedBox(
              width: double.infinity,
              child: FilledButton(
                onPressed: selectedIndex == null ? null : onCheck,
                style: FilledButton.styleFrom(
                  backgroundColor: AppColors.primary,
                  foregroundColor: Colors.white,
                ),
                child: const Text(
                  'تحقق',
                  style: TextStyle(fontWeight: FontWeight.w900),
                ),
              ),
            )
          else ...[
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(14),
              decoration: BoxDecoration(
                color: (correct ? AppColors.primary : AppColors.accent)
                    .withValues(alpha: 0.09),
                borderRadius: BorderRadius.circular(16),
              ),
              child: correct
                  ? Text(
                      feedback,
                      style: TextStyle(
                        color: textColor,
                        height: 1.55,
                        fontWeight: FontWeight.w700,
                      ),
                    )
                  : Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'كيف أصل للإجابة الصحيحة؟',
                          style: TextStyle(
                            color: textColor,
                            fontWeight: FontWeight.w900,
                          ),
                        ),
                        const SizedBox(height: 7),
                        Container(
                          width: double.infinity,
                          padding: const EdgeInsets.symmetric(
                            horizontal: 12,
                            vertical: 9,
                          ),
                          decoration: BoxDecoration(
                            color: AppColors.primary.withValues(alpha: 0.08),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Text(
                            'الإجابة الصحيحة: ${options[correctIndex]}',
                            style: const TextStyle(
                              color: AppColors.primary,
                              fontWeight: FontWeight.w900,
                            ),
                          ),
                        ),
                        const SizedBox(height: 9),
                        Text(
                          feedback,
                          style: TextStyle(
                            color: textColor,
                            height: 1.6,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        const SizedBox(height: 10),
                        Text(
                          'راجع هذه الخطوة:',
                          style: TextStyle(
                            color: mutedColor,
                            fontSize: 12,
                            fontWeight: FontWeight.w900,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          reviewStep,
                          style: TextStyle(
                            color: mutedColor,
                            height: 1.55,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          'وانتبه: $reviewHint',
                          style: const TextStyle(
                            color: AppColors.accent,
                            height: 1.5,
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                      ],
                    ),
            ),
            if (!correct) ...[
              const SizedBox(height: 8),
              TextButton.icon(
                onPressed: onRetry,
                icon: const Icon(Icons.replay_rounded),
                label: const Text('حاول مرة أخرى'),
              ),
            ],
          ],
        ],
      ),
    );
  }
}

class _WarningNote extends StatelessWidget {
  const _WarningNote({
    required this.warning,
    required this.textColor,
    required this.mutedColor,
  });

  final String warning;
  final Color textColor;
  final Color mutedColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: AppColors.accent.withValues(alpha: 0.11),
        borderRadius: BorderRadius.circular(22),
        border: Border.all(
          color: AppColors.accent.withValues(alpha: 0.28),
        ),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Icon(
            Icons.error_outline_rounded,
            color: AppColors.accent,
          ),
          const SizedBox(width: 12),
          Expanded(
            child: RichText(
              text: TextSpan(
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: mutedColor,
                      height: 1.65,
                    ),
                children: [
                  TextSpan(
                    text: 'انتبه: ',
                    style: TextStyle(
                      color: textColor,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                  TextSpan(text: warning),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _ReadyForQuizCard extends StatelessWidget {
  const _ReadyForQuizCard({
    required this.points,
    required this.paper,
    required this.textColor,
    required this.mutedColor,
  });

  final List<String> points;
  final Color paper;
  final Color textColor;
  final Color mutedColor;

  @override
  Widget build(BuildContext context) {
    final checks = points.take(3).toList();

    return Container(
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: paper,
        borderRadius: BorderRadius.circular(24),
        border: Border.all(
          color: AppColors.secondary.withValues(alpha: 0.28),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Icon(
                Icons.fact_check_outlined,
                color: AppColors.secondary,
              ),
              const SizedBox(width: 8),
              Text(
                'هل أنت جاهز للاختبار؟',
                style: TextStyle(
                  color: textColor,
                  fontWeight: FontWeight.w900,
                  fontSize: 15,
                ),
              ),
            ],
          ),
          const SizedBox(height: 7),
          Text(
            'إذا كنت تستطيع شرح هذه النقاط بكلماتك، فأنت غالبًا جاهز.',
            style: TextStyle(
              color: mutedColor,
              height: 1.5,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 12),
          ...checks.map(
            (point) => Padding(
              padding: const EdgeInsets.only(bottom: 8),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Icon(
                    Icons.check_box_outline_blank_rounded,
                    color: AppColors.primary,
                    size: 19,
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Text(
                      point,
                      style: TextStyle(
                        color: textColor,
                        height: 1.5,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _CompletedNote extends StatelessWidget {
  const _CompletedNote({
    required this.paper,
    required this.textColor,
  });

  final Color paper;
  final Color textColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: paper,
        borderRadius: BorderRadius.circular(22),
        border: Border.all(
          color: AppColors.primary.withValues(alpha: 0.25),
        ),
      ),
      child: Row(
        children: [
          const Icon(
            Icons.verified_rounded,
            color: AppColors.primary,
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Text(
              'أكملت هذا الدرس بنجاح. يمكنك إعادة الاختبار وقتما تريد.',
              style: TextStyle(
                color: textColor,
                fontWeight: FontWeight.w800,
                height: 1.5,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _LessonActionBar extends StatelessWidget {
  const _LessonActionBar({
    required this.completed,
    required this.hasNextLesson,
    required this.onQuiz,
    required this.onNext,
  });

  final bool completed;
  final bool hasNextLesson;
  final VoidCallback onQuiz;
  final VoidCallback onNext;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 68,
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: AppColors.primaryDark,
        borderRadius: BorderRadius.circular(22),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.16),
            blurRadius: 24,
            offset: const Offset(0, 12),
          ),
        ],
      ),
      child: Row(
        children: [
          Expanded(
            child: Text(
              completed
                  ? (hasNextLesson ? 'جاهز للخطوة التالية؟' : 'أكملت المسار')
                  : 'جاهز للاختبار؟',
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w900,
              ),
            ),
          ),
          if (completed) ...[
            IconButton(
              onPressed: onQuiz,
              tooltip: 'إعادة الاختبار',
              icon: const Icon(
                Icons.replay_rounded,
                color: Colors.white70,
              ),
            ),
            const SizedBox(width: 4),
          ],
          FilledButton.icon(
            onPressed: completed ? onNext : onQuiz,
            style: FilledButton.styleFrom(
              backgroundColor: AppColors.secondary,
              foregroundColor: AppColors.primaryDark,
            ),
            icon: Icon(
              completed
                  ? (hasNextLesson
                      ? Icons.arrow_back_rounded
                      : Icons.flag_rounded)
                  : Icons.bolt_rounded,
            ),
            label: Text(
              completed
                  ? (hasNextLesson ? 'الدرس التالي' : 'إنهاء')
                  : 'ابدأ',
              style: const TextStyle(fontWeight: FontWeight.w900),
            ),
          ),
        ],
      ),
    );
  }
}

class _NotebookLinesPainter extends CustomPainter {
  const _NotebookLinesPainter({
    required this.lineColor,
    required this.marginColor,
  });

  final Color lineColor;
  final Color marginColor;

  @override
  void paint(Canvas canvas, Size size) {
    final linePaint = Paint()
      ..color = lineColor
      ..strokeWidth = 1;
    final marginPaint = Paint()
      ..color = marginColor
      ..strokeWidth = 1.5;

    const gap = 34.0;
    for (double y = 86; y < size.height; y += gap) {
      canvas.drawLine(Offset(0, y), Offset(size.width, y), linePaint);
    }

    canvas.drawLine(
      Offset(size.width - 34, 0),
      Offset(size.width - 34, size.height),
      marginPaint,
    );
  }

  @override
  bool shouldRepaint(covariant _NotebookLinesPainter oldDelegate) {
    return oldDelegate.lineColor != lineColor ||
        oldDelegate.marginColor != marginColor;
  }
}
