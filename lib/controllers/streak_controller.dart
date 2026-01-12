import 'package:get/get.dart';
import '../data/streak.dart';
import '../remote/streak_api.dart';

class StreakController extends GetxController {
  RxBool isLoading = true.obs;
  RxInt currentDay = 1.obs;
  RxList<StreakDay> days = <StreakDay>[].obs;
  Rx<TopicModel?> todayTopic = Rx(null);

  @override
  void onInit() {
    load();
    super.onInit();
  }

  void load() async {
    try {
      final res = await StreakApi.fetchStreak();

      currentDay.value = res['current_day'];

      days.value = (res['days'] as List)
          .map((e) => StreakDay.fromJson(e))
          .toList();

      todayTopic.value =
          days.firstWhere((d) => d.isCurrent).topic;
    } catch (e) {
      Get.snackbar("Error", e.toString());
    } finally {
      isLoading.value = false;
    }
  }
}
