import 'package:flutter/material.dart';

import '../../../services/progress_service.dart';
import '../../curriculum/models/curriculum_models.dart';
import '../../quizzes/models/quiz_question.dart';
import '../../quizzes/screens/quiz_screen.dart';

class MistakesScreen extends StatefulWidget {
  const MistakesScreen({
    super.key,
    required this.lesson,
    required this.allQuestions,
  });

  final Lesson lesson;
  final List<QuizQuestion> allQuestions;

  @override
  State<MistakesScreen> createState() => _MistakesScreenState();
}

class _MistakesScreenState extends State<MistakesScreen> {
  final ProgressService _progressService = ProgressService();

  bool _loading = true;
  List<QuizQuestion> _mistakes = const <QuizQuestion>[];

  @override
  void initState() {
    super.initState();
    _loadMistakes();
  }

  Future<void> _loadMistakes() async {
    final ids = await _progressService.getMistakeQuestionIds();
    final mistakes =
        widget.allQuestions.where((question) => ids.contains(question.id)).toList();

    if (!mounted) return;
    setState(() {
      _mistakes = mistakes;
      _loading = false;
    });
  }

  Future<void> _reviewMistakes() async {
    if (_mistakes.isEmpty) return;

    await Navigator.of(context).push<bool>(
      MaterialPageRoute<bool>(
        builder: (_) => QuizScreen(
          lesson: widget.lesson,
          questions: _mistakes,
          markLessonComplete: false,
        ),
      ),
    );

    await _loadMistakes();
  }

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return Scaffold(
      appBar: AppBar(title: const Text('راجع أخطاءك')),
      body: _loading
          ? const Center(child: CircularProgressIndicator())
          : _mistakes.isEmpty
              ? const _EmptyMistakes()
              : ListView(
                  padding: const EdgeInsets.fromLTRB(20, 10, 20, 28),
                  children: [
                    Text(
                      'لديك ${_mistakes.length} أسئلة تحتاج مراجعة',
                      style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                            fontWeight: FontWeight.w900,
                          ),
                    ),
                    const SizedBox(height: 6),
                    Text(
                      'اقرأ سبب الخطأ، ثم اختبر نفسك عليها مرة أخرى.',
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                            color: colors.onSurfaceVariant,
                            height: 1.6,
                          ),
                    ),
                    const SizedBox(height: 20),
                    ...List.generate(_mistakes.length, (index) {
                      final question = _mistakes[index];
                      return Padding(
                        padding: const EdgeInsets.only(bottom: 12),
                        child: _MistakeCard(
                          number: index + 1,
                          question: question,
                        ),
                      );
                    }),
                    const SizedBox(height: 8),
                    FilledButton.icon(
                      onPressed: _reviewMistakes,
                      icon: const Icon(Icons.replay_rounded),
                      label: const Padding(
                        padding: EdgeInsets.symmetric(vertical: 14),
                        child: Text(
                          'اختبرني في أخطائي',
                          style: TextStyle(fontWeight: FontWeight.w900),
                        ),
                      ),
                    ),
                  ],
                ),
    );
  }
}

class _MistakeCard extends StatelessWidget {
  const _MistakeCard({
    required this.number,
    required this.question,
  });

  final int number;
  final QuizQuestion question;

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return Container(
      padding: const EdgeInsets.all(17),
      decoration: BoxDecoration(
        color: colors.surface,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: colors.outlineVariant),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'السؤال $number',
            style: TextStyle(
              color: colors.error,
              fontSize: 12,
              fontWeight: FontWeight.w900,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            question.question,
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.w900,
                  height: 1.45,
                ),
          ),
          const SizedBox(height: 10),
          Text(
            question.explanation,
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: colors.onSurfaceVariant,
                  height: 1.6,
                ),
          ),
        ],
      ),
    );
  }
}

class _EmptyMistakes extends StatelessWidget {
  const _EmptyMistakes();

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return Center(
      child: Padding(
        padding: const EdgeInsets.all(32),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 86,
              height: 86,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.green.withValues(alpha: 0.10),
              ),
              child: const Icon(
                Icons.task_alt_rounded,
                size: 44,
                color: Colors.green,
              ),
            ),
            const SizedBox(height: 20),
            Text(
              'لا توجد أخطاء للمراجعة',
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                    fontWeight: FontWeight.w900,
                  ),
            ),
            const SizedBox(height: 8),
            Text(
              'أي سؤال تخطئ فيه سيظهر هنا تلقائيًا.',
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: colors.onSurfaceVariant,
                  ),
            ),
          ],
        ),
      ),
    );
  }
}
