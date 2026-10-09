import '../../curriculum/data/grade2_math_data.dart';
import '../../curriculum/models/curriculum_models.dart';
import '../models/quiz_question.dart';
import 'equations_inequalities_quiz.dart';
import 'geometry_quiz.dart';
import 'linear_functions_quiz.dart';
import 'measurement_quiz.dart';
import 'percent_quiz.dart';
import 'probability_quiz.dart';
import 'proportions_quiz.dart';
import 'rational_numbers_quiz.dart';
import 'real_numbers_quiz.dart';
import 'statistics_quiz.dart';

List<QuizQuestion> quizForGrade2MathLesson(String lessonId) {
  final linearFunctionsQuiz = linearFunctionsQuizForLesson(lessonId);
  if (linearFunctionsQuiz.isNotEmpty) return linearFunctionsQuiz;

  final equationsQuiz = equationsInequalitiesQuizForLesson(lessonId);
  if (equationsQuiz.isNotEmpty) return equationsQuiz;

  final measurementQuiz = measurementQuizForLesson(lessonId);
  if (measurementQuiz.isNotEmpty) return measurementQuiz;

  final probabilityQuiz = probabilityQuizForLesson(lessonId);
  if (probabilityQuiz.isNotEmpty) return probabilityQuiz;

  final statisticsQuiz = statisticsQuizForLesson(lessonId);
  if (statisticsQuiz.isNotEmpty) return statisticsQuiz;

  final geometryQuiz = geometryQuizForLesson(lessonId);
  if (geometryQuiz.isNotEmpty) return geometryQuiz;

  final percentQuiz = percentQuizForLesson(lessonId);
  if (percentQuiz.isNotEmpty) return percentQuiz;

  final proportionsQuiz = proportionsQuizForLesson(lessonId);
  if (proportionsQuiz.isNotEmpty) return proportionsQuiz;

  final realQuiz = realNumbersQuizForLesson(lessonId);
  if (realQuiz.isNotEmpty) return realQuiz;

  return quizForLesson(lessonId);
}

const allGrade2MathQuestions = <QuizQuestion>[
  ...allRationalNumbersQuestions,
  ...allRealNumbersQuestions,
  ...allProportionsQuestions,
  ...allPercentQuestions,
  ...allGeometryQuestions,
  ...allStatisticsQuestions,
  ...allProbabilityQuestions,
  ...allMeasurementQuestions,
  ...allEquationsInequalitiesQuestions,
  ...allLinearFunctionsQuestions,
];


Lesson? lessonForGrade2MathQuestion(String questionId) {
  for (final chapter in grade2MathChapters) {
    for (final lesson in chapter.lessons.where((lesson) => lesson.isAvailable)) {
      final questions = quizForGrade2MathLesson(lesson.id);
      if (questions.any((question) => question.id == questionId)) {
        return lesson;
      }
    }
  }

  return null;
}
