class Lesson {
  const Lesson({
    required this.id,
    required this.title,
    required this.subtitle,
    this.isAvailable = true,
  });

  final String id;
  final String title;
  final String subtitle;
  final bool isAvailable;
}

class Chapter {
  const Chapter({
    required this.id,
    required this.title,
    required this.subtitle,
    required this.lessons,
  });

  final String id;
  final String title;
  final String subtitle;
  final List<Lesson> lessons;
}
