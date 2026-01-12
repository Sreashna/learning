import 'package:get/get.dart';
import '../remote/home_api.dart';

class HomeController extends GetxController {
  var isLoading = true.obs;

  var userName = "".obs;
  var greeting = "".obs;
  var streakDays = 0.obs;
  var streakIcon = "".obs;

  var heroBanners = [].obs;
  var bannerIndex = 0.obs;

  var activeCourseTitle = "".obs;
  var courseProgress = 0.0.obs;
  var completedTests = 0.obs;
  var totalTests = 0.obs;

  var videos = [].obs;

  var popularCategories = [].obs;
  var selectedPopularIndex = 0.obs;
  var isLive = false.obs;
  var liveTitle = "".obs;
  var liveInstructor = "".obs;
  var liveSessionInfo = "".obs;
  var liveAction = "".obs;

  RxString selectedCourse = "".obs;
  RxList<String> popularCourses = <String>[].obs;




  @override
  void onInit() {
    fetchAll();
    super.onInit();
  }

  void fetchAll() async {
    try {
      isLoading(true);

      final home = await HomeApi.fetchHome();
      final videoData = await HomeApi.fetchVideos();
      final streak = await HomeApi.fetchStreak();


      final user = home['user'];
      userName.value = user['name'] ?? "";
      greeting.value = user['greeting'] ?? "";
      streakDays.value = user['streak']['days'] ?? 0;
      streakIcon.value = user['streak']['icon'] ?? "";

      heroBanners.value = home['hero_banners'] ?? [];
      final idx = heroBanners.indexWhere((e) => e['is_active'] == true);
      bannerIndex.value = idx == -1 ? 0 : idx;

      final activeCourse = home['active_course'];

      if (activeCourse != null) {
        activeCourseTitle.value = activeCourse['title'] ?? "";
        courseProgress.value = (activeCourse['progress'] ?? 0) / 100;
        completedTests.value = activeCourse['tests_completed'] ?? 0;
        totalTests.value = activeCourse['total_tests'] ?? 0;
      }

      videos.value = videoData['data']?['videos'] ?? [];

      popularCategories.value = home['popular_courses'] ?? [];

      final live = home['live_session'];
      if (live != null) {
        isLive.value = live['is_live'] ?? false;
        liveTitle.value = live['title'] ?? "";
        liveInstructor.value = live['instructor']['name'] ?? "";
        liveSessionInfo.value =
        "Session ${live['session_details']['session_number']} • "
            "${live['session_details']['date']} ${live['session_details']['time']}";
        liveAction.value = live['action'] ?? "";
      }





    } catch (e) {
      print("HOME API ERROR: $e");
    } finally {
      isLoading(false);
    }
  }
}
