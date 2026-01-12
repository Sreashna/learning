import 'dart:convert';
import 'package:http/http.dart' as http;

class HomeApi {
  static const String base = "https://trogon.info/task/api/";

  static Future<Map<String, dynamic>> fetchHome() async {
    final res = await http.get(Uri.parse("${base}home.php?user_id=1"));
    final json = jsonDecode(res.body);

    if (json == null) throw Exception("Home API empty");

    return Map<String, dynamic>.from(json);
  }

  static Future<Map<String, dynamic>> fetchVideos() async {
    final res = await http.get(Uri.parse("${base}video_details.php?user_id=1"));
    final json = jsonDecode(res.body);

    if (json == null) throw Exception("Video API empty");

    return Map<String, dynamic>.from(json);
  }

  static Future<Map<String, dynamic>> fetchStreak() async {
    final res = await http.get(Uri.parse("${base}streak.php?user_id=1"));
    final json = jsonDecode(res.body);

    if (json == null) throw Exception("Streak API empty");

    return Map<String, dynamic>.from(json);
  }
}
