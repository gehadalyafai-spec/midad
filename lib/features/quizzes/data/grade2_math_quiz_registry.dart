import '../models/quiz_question.dart';
import 'rational_numbers_quiz.dart';
import 'real_numbers_quiz.dart';

List<QuizQuestion> quizForGrade2MathLesson(String lessonId) {
  final realQuiz = realNumbersQuizForLesson(lessonId);
  if (realQuiz.isNotEmpty) return realQuiz;

  return quizForLesson(lessonId);
}

const allGrade2MathQuestions = <QuizQuestion>[
  ...allRationalNumbersQuestions,
  ...allRealNumbersQuestions,
];
