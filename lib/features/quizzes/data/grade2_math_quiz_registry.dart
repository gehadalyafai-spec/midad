import '../models/quiz_question.dart';
import 'geometry_quiz.dart';
import 'percent_quiz.dart';
import 'proportions_quiz.dart';
import 'rational_numbers_quiz.dart';
import 'real_numbers_quiz.dart';
import 'statistics_quiz.dart';

List<QuizQuestion> quizForGrade2MathLesson(String lessonId) {
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
];
