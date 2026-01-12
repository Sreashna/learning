class PopularCategory {
  final int id;
  final String name;
  final List<PopularCourse> courses;

  PopularCategory({
    required this.id,
    required this.name,
    required this.courses,
  });

  factory PopularCategory.fromJson(Map<String, dynamic> json) {
    return PopularCategory(
      id: json['id'],
      name: json['name'],
      courses: (json['courses'] as List)
          .map((e) => PopularCourse.fromJson(e))
          .toList(),
    );
  }
}

class PopularCourse {
  final int id;
  final String title;
  final String image;
  final String action;

  PopularCourse({
    required this.id,
    required this.title,
    required this.image,
    required this.action,
  });

  factory PopularCourse.fromJson(Map<String, dynamic> json) {
    return PopularCourse(
      id: json['id'],
      title: json['title'],
      image: json['image'],
      action: json['action'],
    );
  }
}
