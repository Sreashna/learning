import 'package:get/get.dart';
import 'package:video_player/video_player.dart';

import '../data/videomodel.dart';
import '../video/api.dart';


class VideoController extends GetxController {
  RxBool isLoading = true.obs;
  RxString title = "".obs;
  RxList<VideoModel> videos = <VideoModel>[].obs;
  Rx<VideoModel?> selectedVideo = Rx(null);

  VideoPlayerController? player;

  @override
  void onInit() {
    load();
    super.onInit();
  }

  void load() async {
    final res = await VideoApi.fetchVideos();
    title.value = res['data']['title'];

    videos.value = (res['data']['videos'] as List)
        .map((e) => VideoModel.fromJson(e))
        .toList();

    final current = videos.firstWhere(
          (v) => v.status == "in_progress",
      orElse: () => videos.firstWhere((v) => v.hasPlay),
    );

    selectVideo(current);
    isLoading.value = false;
  }

  void selectVideo(VideoModel v) {
    if (!v.hasPlay || v.videoUrl == null) return;

    selectedVideo.value = v;
    player?.dispose();

    player = VideoPlayerController.network(v.videoUrl!)
      ..initialize().then((_) {
        update();
        player!.play();
      });
  }

  void togglePlay() {
    if (player == null) return;
    player!.value.isPlaying ? player!.pause() : player!.play();
  }

  @override
  void onClose() {
    player?.dispose();
    super.onClose();
  }
}
