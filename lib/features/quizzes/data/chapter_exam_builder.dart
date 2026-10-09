import '../../curriculum/models/curriculum_models.dart';
import '../models/quiz_question.dart';
import 'grade2_math_quiz_registry.dart';

List<QuizQuestion> chapterExamQuestions(
  Chapter chapter, {
  int maxQuestions = 10,
}) {
  final lessonPools = chapter.lessons
      .where((lesson) => lesson.isAvailable)
      .map((lesson) => quizForGrade2MathLesson(lesson.id))
      .where((questions) => questions.isNotEmpty)
      .toList();

  final selected = <QuizQuestion>[];
  var questionIndex = 0;

  while (selected.length < maxQuestions) {
    var addedInRound = false;

    for (final pool in lessonPools) {
      if (questionIndex >= pool.length) continue;

      selected.add(pool[questionIndex]);
      addedInRound = true;

      if (selected.length == maxQuestions) {
        return List<QuizQuestion>.unmodifiable(selected);
      }
    }

    if (!addedInRound) break;
    questionIndex++;
  }

  return List<QuizQuestion>.unmodifiable(selected);
}
