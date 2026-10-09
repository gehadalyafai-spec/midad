import 'package:flutter_test/flutter_test.dart';
import 'package:midad/features/curriculum/data/grade2_math_data.dart';
import 'package:midad/features/lessons/data/grade2_math_lesson_registry.dart';
import 'package:midad/features/lessons/widgets/lesson_visual_aid.dart';
import 'package:midad/features/quizzes/data/grade2_math_quiz_registry.dart';

void main() {
  test('grade 2 math contains ten curriculum chapters', () {
    expect(grade2MathChapters, hasLength(10));
    expect(grade2MathChapters[0].title, 'الأعداد النسبية');
    expect(grade2MathChapters[1].title, 'الأعداد الحقيقية ونظرية فيثاغورس');
    expect(grade2MathChapters[2].title, 'التناسب والتشابه');
    expect(grade2MathChapters[3].title, 'النسبة المئوية');
    expect(grade2MathChapters[4].title, 'الهندسة والاستدلال المكاني');
    expect(grade2MathChapters[5].title, 'الإحصاء');
    expect(grade2MathChapters[6].title, 'الاحتمالات');
    expect(grade2MathChapters[7].title, 'القياس: المساحة والحجم');
    expect(grade2MathChapters[8].title, 'الجبر: المعادلات والمتباينات');
    expect(grade2MathChapters[9].title, 'الجبر: الدوال الخطية');
  });

  test('course exposes seventy one available lessons', () {
    final lessons = grade2MathChapters
        .expand((chapter) => chapter.lessons)
        .where((lesson) => lesson.isAvailable)
        .toList();

    expect(lessons, hasLength(71));
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
        expect(
          content.hasExtendedExplanation,
          isTrue,
          reason: 'Missing guided explanation for ${lesson.id}',
        );
        expect(
          content.intro,
          isNotEmpty,
          reason: 'Missing intro for ${lesson.id}',
        );
        expect(
          content.whyItMatters,
          isNotEmpty,
          reason: 'Missing why-it-matters for ${lesson.id}',
        );
        expect(
          content.steps.length,
          greaterThanOrEqualTo(4),
          reason: 'Not enough guided steps for ${lesson.id}',
        );
        expect(
          content.secondExampleBody,
          isNotEmpty,
          reason: 'Missing second example for ${lesson.id}',
        );
        expect(
          content.summaryPoints.length,
          greaterThanOrEqualTo(3),
          reason: 'Missing summary points for ${lesson.id}',
        );
        expect(
          hasVisualAidForLesson(lesson.id),
          isTrue,
          reason: 'Missing visual aid for ${lesson.id}',
        );
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

    expect(allGrade2MathQuestions, hasLength(355));
  });
}
