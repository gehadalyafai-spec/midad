import 'package:shared_preferences/shared_preferences.dart';

import '../features/curriculum/models/curriculum_models.dart';

class ProgressService {
  ProgressService({SharedPreferencesAsync? preferences})
      : _preferences = preferences ?? SharedPreferencesAsync();

  static const _completedLessonsKey = 'completed_lesson_ids';
  static const _lastLessonIdKey = 'last_lesson_id';
  static const _lastLessonTitleKey = 'last_lesson_title';

  final SharedPreferencesAsync _preferences;

  Future<Set<String>> getCompletedLessonIds() async {
    final values = await _preferences.getStringList(_completedLessonsKey);
    return (values ?? const <String>[]).toSet();
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
}
