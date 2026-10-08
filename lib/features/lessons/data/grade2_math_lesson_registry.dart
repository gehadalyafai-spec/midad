import 'grade2_math_lesson_content.dart';
import 'proportions_lesson_content.dart';
import 'real_numbers_lesson_content.dart';

LessonContent lessonContentForGrade2Math(String lessonId) {
  final rational = grade2MathLessonContent[lessonId];
  if (rational != null) return rational;

  final real = realNumbersLessonContent[lessonId];
  if (real != null) return real;

  final proportions = proportionsLessonContent[lessonId];
  if (proportions != null) return proportions;

  throw StateError('No lesson content registered for $lessonId');
}
