import 'dart:convert';
import 'package:http/http.dart' as http;

class VideoApi {
  static const String url =
      "https://trogon.info/task/api/video_details.php";

  static Future<Map<String, dynamic>> fetchVideos() async {
    final res = await http.get(Uri.parse(url));
    return jsonDecode(res.body);
  }
}
