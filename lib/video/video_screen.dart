import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:video_player/video_player.dart';
import '../controllers/video_controller.dart';
import '../data/videomodel.dart';

class VideoPage extends StatelessWidget {
  const VideoPage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(VideoController());

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: const BackButton(color: Colors.black),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Obx(() {
        if (controller.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        }

        final video = controller.selectedVideo.value!;

        return SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(16),
                child: _videoPlayer(controller),
              ),

              Padding(
                padding: const EdgeInsets.all(16),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(video.title,
                              style: const TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold)),
                          const SizedBox(height: 4),
                          Text(video.description,
                              style: const TextStyle(color: Colors.grey)),
                        ],
                      ),
                    ),
                    CircleAvatar(
                      backgroundColor: const Color(0xFFE0F7FA),
                      child: Icon(Icons.download, color: const Color(0xFF00ABBC)),
                    ),
                  ],
                ),
              ),


              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: Text("Meditation Journey",
                    style:
                    TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
              ),

              const SizedBox(height: 16),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  children: controller.videos
                      .asMap()
                      .entries
                      .map((e) => _tile(e.value, controller,
                      e.key == controller.videos.length - 1))
                      .toList(),
                ),
              ),
            ],
          ),
        );
      }),
    );
  }

  Widget _videoPlayer(VideoController controller) {
    final player = controller.player!;
    return Stack(
      alignment: Alignment.center,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(16),
          child: AspectRatio(
            aspectRatio: player.value.aspectRatio,
            child: VideoPlayer(player),
          ),
        ),
        GestureDetector(
          onTap: controller.togglePlay,
          child: Icon(
            player.value.isPlaying
                ? Icons.pause_circle_filled
                : Icons.play_circle_fill,
            size: 64,
            color: Colors.white,
          ),
        ),
        Positioned(
          bottom: 0,
          left: 0,
          right: 0,
          child: VideoProgressIndicator(
            player,
            allowScrubbing: true,
            colors: VideoProgressColors(
              playedColor: const Color(0xFF00ABBC),
              backgroundColor: Colors.white24,
            ),
          ),
        ),
      ],
    );
  }

  Widget _tile(VideoModel v, VideoController controller, bool last) {
    final selected = controller.selectedVideo.value?.id == v.id;

    Color color = v.status == "completed"
        ? Colors.green
        : v.status == "locked"
        ? Colors.grey
        : const Color(0xFF00ABBC);

    IconData icon = v.status == "completed"
        ? Icons.check
        : v.status == "locked"
        ? Icons.lock
        : Icons.play_arrow;

    return Row(children: [
      Column(children: [
        CircleAvatar(backgroundColor: color, child: Icon(icon, color: Colors.white)),
        if (!last)
          Container(width: 2, height: 50, color: Colors.grey.shade300)
      ]),
      const SizedBox(width: 16),
      Expanded(
        child: GestureDetector(
          onTap: v.hasPlay ? () => controller.selectVideo(v) : null,
          child: Container(
            margin: const EdgeInsets.only(bottom: 16),
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: selected ? const Color(0xFFE0F7FA) : Colors.white,
              borderRadius: BorderRadius.circular(16),
              boxShadow: const [
                BoxShadow(color: Colors.black12, blurRadius: 10)
              ],
            ),
            child: Row(children: [
              Expanded(
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(v.title,
                          style: const TextStyle(
                              fontWeight: FontWeight.bold)),
                      Text(v.description,
                          style: const TextStyle(
                              fontSize: 12, color: Colors.grey)),
                    ]),
              ),
              Icon(Icons.play_circle_fill,
                  color: v.hasPlay
                      ? const Color(0xFF00ABBC)
                      : Colors.grey)
            ]),
          ),
        ),
      )
    ]);
  }
}
