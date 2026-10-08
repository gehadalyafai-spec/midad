import 'geometry_lesson_content.dart';
import 'grade2_math_lesson_content.dart';
import 'measurement_lesson_content.dart';
import 'percent_lesson_content.dart';
import 'probability_lesson_content.dart';
import 'proportions_lesson_content.dart';
import 'real_numbers_lesson_content.dart';
import 'statistics_lesson_content.dart';

LessonContent lessonContentForGrade2Math(String lessonId) {
  final rational = grade2MathLessonContent[lessonId];
  if (rational != null) return rational;

  final real = realNumbersLessonContent[lessonId];
  if (real != null) return real;

  final proportions = proportionsLessonContent[lessonId];
  if (proportions != null) return proportions;

  final percent = percentLessonContent[lessonId];
  if (percent != null) return percent;

  final geometry = geometryLessonContent[lessonId];
  if (geometry != null) return geometry;

  final statistics = statisticsLessonContent[lessonId];
  if (statistics != null) return statistics;

  final probability = probabilityLessonContent[lessonId];
  if (probability != null) return probability;

  final measurement = measurementLessonContent[lessonId];
  if (measurement != null) return measurement;

  throw StateError('No lesson content registered for $lessonId');
}
