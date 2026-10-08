import '../models/quiz_question.dart';
import 'proportions_quiz.dart';
import 'rational_numbers_quiz.dart';
import 'real_numbers_quiz.dart';

List<QuizQuestion> quizForGrade2MathLesson(String lessonId) {
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
];
