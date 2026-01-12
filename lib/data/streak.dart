class ModuleModel {
  final String name;
  final String description;

  ModuleModel({required this.name, required this.description});

  factory ModuleModel.fromJson(Map<String, dynamic> json) {
    return ModuleModel(
      name: json['name'],
      description: json['description'],
    );
  }
}

class TopicModel {
  final String title;
  final List<ModuleModel> modules;

  TopicModel({required this.title, required this.modules});

  factory TopicModel.fromJson(Map<String, dynamic> json) {
    return TopicModel(
      title: json['title'],
      modules: (json['modules'] as List)
          .map((e) => ModuleModel.fromJson(e))
          .toList(),
    );
  }
}

class StreakDay {
  final int id;
  final int dayNumber;
  final String label;
  final bool isCompleted;
  final bool isCurrent;
  final TopicModel topic;

  StreakDay({
    required this.id,
    required this.dayNumber,
    required this.label,
    required this.isCompleted,
    required this.isCurrent,
    required this.topic,
  });

  factory StreakDay.fromJson(Map<String, dynamic> json) {
    return StreakDay(
      id: json['id'],
      dayNumber: json['day_number'],
      label: json['label'],
      isCompleted: json['is_completed'],
      isCurrent: json['is_current'],
      topic: TopicModel.fromJson(json['topic']),
    );
  }
}
