class ActiveCourse {
  final int id;
  final String title;
  final int progress;
  final int testsCompleted;
  final int totalTests;

  ActiveCourse({
    required this.id,
    required this.title,
    required this.progress,
    required this.testsCompleted,
    required this.totalTests,
  });

  factory ActiveCourse.fromJson(Map<String, dynamic> json) {
    return ActiveCourse(
      id: json['id'],
      title: json['title'],
      progress: json['progress'],
      testsCompleted: json['tests_completed'],
      totalTests: json['total_tests'],
    );
  }
}
