import 'package:untitled/data/popular.dart';
import 'package:untitled/data/user.dart';

import 'active.dart';
import 'herobanner.dart';
import 'live.dart';

class HomeResponse {
  final User user;
  final List<HeroBanner> heroBanners;
  final ActiveCourse activeCourse;
  final List<PopularCategory> popularCourses;
  final LiveSession liveSession;

  HomeResponse({
    required this.user,
    required this.heroBanners,
    required this.activeCourse,
    required this.popularCourses,
    required this.liveSession,
  });

  factory HomeResponse.fromJson(Map<String, dynamic> json) {
    return HomeResponse(
      user: User.fromJson(json['user']),
      heroBanners: (json['hero_banners'] as List)
          .map((e) => HeroBanner.fromJson(e))
          .toList(),
      activeCourse: ActiveCourse.fromJson(json['active_course']),
      popularCourses: (json['popular_courses'] as List)
          .map((e) => PopularCategory.fromJson(e))
          .toList(),
      liveSession: LiveSession.fromJson(json['live_session']),
    );
  }
}
