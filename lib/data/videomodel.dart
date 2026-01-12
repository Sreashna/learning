class VideoModel {
  final int id;
  final String title;
  final String description;
  final String? videoUrl;
  final String status;
  final int totalDuration;
  final int watchedDuration;
  final int progress;
  final bool hasPlay;

  VideoModel({
    required this.id,
    required this.title,
    required this.description,
    required this.videoUrl,
    required this.status,
    required this.totalDuration,
    required this.watchedDuration,
    required this.progress,
    required this.hasPlay,
  });

  factory VideoModel.fromJson(Map<String, dynamic> json) {
    return VideoModel(
      id: json['id'],
      title: json['title'],
      description: json['description'],
      videoUrl: json['video_url'],
      status: json['status'],
      totalDuration: json['total_duration'],
      watchedDuration: json['watched_duration'],
      progress: json['progress_percentage'],
      hasPlay: json['has_play_button'],
    );
  }
}
