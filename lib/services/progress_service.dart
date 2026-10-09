import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

import '../features/curriculum/models/curriculum_models.dart';

class ProgressService {
  ProgressService({SharedPreferencesAsync? preferences})
      : _preferences = preferences ?? SharedPreferencesAsync();

  static const _completedLessonsKey = 'completed_lesson_ids';
  static const _lastLessonIdKey = 'last_lesson_id';
  static const _lastLessonTitleKey = 'last_lesson_title';
  static const _mistakeQuestionIdsKey = 'mistake_question_ids';
  static const _examBestScoresKey = 'exam_best_scores_v1';

  final SharedPreferencesAsync _preferences;

  Future<Set<String>> getCompletedLessonIds() async {
    final values = await _preferences.getStringList(_completedLessonsKey);
    return (values ?? const <String>[]).toSet();
  }

  Future<Set<String>> getMistakeQuestionIds() async {
    final values = await _preferences.getStringList(_mistakeQuestionIdsKey);
    return (values ?? const <String>[]).toSet();
  }

  Future<Map<String, int>> getExamBestScores() async {
    final raw = await _preferences.getString(_examBestScoresKey);
    if (raw == null || raw.isEmpty) return <String, int>{};

    try {
      final decoded = jsonDecode(raw);
      if (decoded is! Map<String, dynamic>) return <String, int>{};

      return decoded.map(
        (key, value) => MapEntry(key, (value as num).round()),
      );
    } catch (_) {
      return <String, int>{};
    }
  }

  Future<int?> getExamBestScore(String examId) async {
    final scores = await getExamBestScores();
    return scores[examId];
  }

  Future<void> recordExamResult({
    required String examId,
    required int score,
    required int total,
  }) async {
    if (total <= 0) return;

    final percent = ((score / total) * 100).round();
    final scores = await getExamBestScores();
    final previous = scores[examId];

    if (previous != null && previous >= percent) return;

    scores[examId] = percent;
    await _preferences.setString(
      _examBestScoresKey,
      jsonEncode(scores),
    );
  }

  Future<String?> getLastLessonId() {
    return _preferences.getString(_lastLessonIdKey);
  }

  Future<String?> getLastLessonTitle() {
    return _preferences.getString(_lastLessonTitleKey);
  }

  Future<void> markLessonStarted(Lesson lesson) async {
    await _preferences.setString(_lastLessonIdKey, lesson.id);
    await _preferences.setString(_lastLessonTitleKey, lesson.title);
  }

  Future<void> markLessonCompleted(Lesson lesson) async {
    final completed = await getCompletedLessonIds();
    completed.add(lesson.id);
    final sorted = completed.toList()..sort();

    await _preferences.setStringList(_completedLessonsKey, sorted);
    await markLessonStarted(lesson);
  }

  Future<void> recordQuestionResult({
    required String questionId,
    required bool isCorrect,
  }) async {
    final mistakes = await getMistakeQuestionIds();

    if (isCorrect) {
      mistakes.remove(questionId);
    } else {
      mistakes.add(questionId);
    }

    final sorted = mistakes.toList()..sort();
    await _preferences.setStringList(_mistakeQuestionIdsKey, sorted);
  }
}
