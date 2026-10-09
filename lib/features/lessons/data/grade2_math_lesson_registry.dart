import 'equations_inequalities_lesson_content.dart';
import 'geometry_lesson_content.dart';
import 'grade2_math_lesson_content.dart';
import 'guidance/equations_guidance.dart';
import 'guidance/geometry_guidance.dart';
import 'guidance/linear_functions_guidance.dart';
import 'guidance/measurement_guidance.dart';
import 'guidance/probability_guidance.dart';
import 'guidance/proportions_guidance.dart';
import 'guidance/rational_guidance.dart';
import 'guidance/real_numbers_guidance.dart';
import 'guidance/statistics_guidance.dart';
import 'lesson_guidance.dart';
import 'linear_functions_lesson_content.dart';
import 'measurement_lesson_content.dart';
import 'percent_lesson_content.dart';
import 'probability_lesson_content.dart';
import 'proportions_lesson_content.dart';
import 'real_numbers_lesson_content.dart';
import 'statistics_lesson_content.dart';

LessonContent lessonContentForGrade2Math(String lessonId) {
  final base = _baseLessonContent(lessonId);
  final guidance = _guidanceForLesson(lessonId);

  if (guidance == null) return base;
  return applyLessonGuidance(base, guidance);
}

LessonContent _baseLessonContent(String lessonId) {
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

  final equations = equationsInequalitiesLessonContent[lessonId];
  if (equations != null) return equations;

  final linearFunctions = linearFunctionsLessonContent[lessonId];
  if (linearFunctions != null) return linearFunctions;

  throw StateError('No lesson content registered for $lessonId');
}

LessonGuidance? _guidanceForLesson(String lessonId) {
  return rationalGuidance[lessonId] ??
      realNumbersGuidance[lessonId] ??
      proportionsGuidance[lessonId] ??
      geometryGuidance[lessonId] ??
      statisticsGuidance[lessonId] ??
      probabilityGuidance[lessonId] ??
      measurementGuidance[lessonId] ??
      equationsGuidance[lessonId] ??
      linearFunctionsGuidance[lessonId];
}
