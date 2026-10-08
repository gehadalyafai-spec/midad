import 'package:flutter_test/flutter_test.dart';
import 'package:midad/features/curriculum/data/grade2_math_data.dart';
import 'package:midad/features/lessons/data/grade2_math_lesson_content.dart';
import 'package:midad/features/quizzes/data/rational_numbers_quiz.dart';

void main() {
  test('starter curriculum exposes four complete learning experiences', () {
    final chapter = grade2MathChapters.first;
    final availableLessons =
        chapter.lessons.where((lesson) => lesson.isAvailable).toList();

    expect(chapter.title, 'الأعداد النسبية');
    expect(availableLessons, hasLength(4));
    expect(
      availableLessons.map((lesson) => lesson.id).toList(),
      [
        'rational-numbers-intro',
        'compare-rational',
        'multiply-rational',
        'divide-rational',
      ],
    );
  });

  test('every available lesson has content, practice and five quiz questions', () {
    final chapter = grade2MathChapters.first;
    final availableLessons =
        chapter.lessons.where((lesson) => lesson.isAvailable);

    for (final lesson in availableLessons) {
      final content = lessonContentFor(lesson.id);
      final quiz = quizForLesson(lesson.id);

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
  });

  test('all rational numbers quiz questions have valid answers', () {
    expect(allRationalNumbersQuestions, hasLength(20));

    for (final question in allRationalNumbersQuestions) {
      expect(question.options, hasLength(4));
      expect(question.correctIndex, inInclusiveRange(0, 3));
      expect(question.explanation, isNotEmpty);
    }
  });
}
