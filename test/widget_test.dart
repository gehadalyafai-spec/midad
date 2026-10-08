import 'package:flutter_test/flutter_test.dart';
import 'package:midad/features/curriculum/data/grade2_math_data.dart';
import 'package:midad/features/lessons/data/grade2_math_lesson_registry.dart';
import 'package:midad/features/quizzes/data/grade2_math_quiz_registry.dart';

void main() {
  test('grade 2 math contains the first three curriculum chapters', () {
    expect(grade2MathChapters, hasLength(3));
    expect(grade2MathChapters[0].title, 'الأعداد النسبية');
    expect(grade2MathChapters[1].title, 'الأعداد الحقيقية ونظرية فيثاغورس');
    expect(grade2MathChapters[2].title, 'التناسب والتشابه');
  });

  test('every lesson has content, practice and five quiz questions', () {
    for (final chapter in grade2MathChapters) {
      for (final lesson in chapter.lessons.where((lesson) => lesson.isAvailable)) {
        final content = lessonContentForGrade2Math(lesson.id);
        final quiz = quizForGrade2MathLesson(lesson.id);

        expect(content.sectionOneBody, isNotEmpty);
        expect(content.sectionTwoBody, isNotEmpty);
        expect(content.exampleBody, isNotEmpty);
        expect(content.warning, isNotEmpty);
        expect(content.practiceOptions.length, greaterThanOrEqualTo(3));
        expect(
          content.practiceCorrectIndex,
          inInclusiveRange(0, content.practiceOptions.length - 1),
        );
        expect(quiz, hasLength(5));
      }
    }
  });

  test('all registered quiz questions have valid and unique ids', () {
    final ids = <String>{};

    for (final question in allGrade2MathQuestions) {
      expect(question.options, hasLength(4));
      expect(question.correctIndex, inInclusiveRange(0, 3));
      expect(question.explanation, isNotEmpty);
      expect(ids.add(question.id), isTrue);
    }

    expect(allGrade2MathQuestions, hasLength(115));
  });
}
