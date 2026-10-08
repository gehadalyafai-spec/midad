import 'package:flutter_test/flutter_test.dart';
import 'package:midad/features/curriculum/data/grade2_math_data.dart';
import 'package:midad/features/quizzes/data/rational_numbers_quiz.dart';

void main() {
  test('starter curriculum contains the first available lesson', () {
    final chapter = grade2MathChapters.first;
    final availableLessons =
        chapter.lessons.where((lesson) => lesson.isAvailable).toList();

    expect(chapter.title, 'الأعداد النسبية');
    expect(availableLessons, hasLength(1));
    expect(availableLessons.first.id, 'rational-numbers-intro');
  });

  test('starter quiz has valid answers', () {
    expect(rationalNumbersIntroQuiz, hasLength(5));

    for (final question in rationalNumbersIntroQuiz) {
      expect(question.options, hasLength(4));
      expect(question.correctIndex, inInclusiveRange(0, 3));
      expect(question.explanation, isNotEmpty);
    }
  });
}
