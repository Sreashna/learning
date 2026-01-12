class User {
  final String name;
  final String greeting;
  final Streak streak;

  User({
    required this.name,
    required this.greeting,
    required this.streak,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      name: json['name'],
      greeting: json['greeting'],
      streak: Streak.fromJson(json['streak']),
    );
  }
}

class Streak {
  final int days;
  final String icon;

  Streak({required this.days, required this.icon});

  factory Streak.fromJson(Map<String, dynamic> json) {
    return Streak(
      days: json['days'],
      icon: json['icon'],
    );
  }
}
