import '../../curriculum/models/curriculum_models.dart';
import '../models/quiz_question.dart';
import 'grade2_math_quiz_registry.dart';

List<QuizQuestion> courseExamQuestions(List<Chapter> chapters) {
  final selected = <QuizQuestion>[];

  for (final chapter in chapters) {
    final lessons =
        chapter.lessons.where((lesson) => lesson.isAvailable).toList();
    if (lessons.isEmpty) continue;

    final firstPool = quizForGrade2MathLesson(lessons.first.id);
    if (firstPool.isNotEmpty) {
      selected.add(firstPool.first);
    }

    if (lessons.length > 1) {
      final lastPool = quizForGrade2MathLesson(lessons.last.id);
      if (lastPool.isNotEmpty) {
        selected.add(lastPool.first);
      }
    } else if (firstPool.length > 1) {
      selected.add(firstPool[1]);
    }
  }

  return List<QuizQuestion>.unmodifiable(selected);
}
