class HeroBanner {
  final int id;
  final String title;
  final String image;
  final bool isActive;

  HeroBanner({
    required this.id,
    required this.title,
    required this.image,
    required this.isActive,
  });

  factory HeroBanner.fromJson(Map<String, dynamic> json) {
    return HeroBanner(
      id: json['id'],
      title: json['title'],
      image: json['image'],
      isActive: json['is_active'],
    );
  }
}
