import 'dart:convert';
import 'package:http/http.dart' as http;

class StreakApi {
  static const url = "https://trogon.info/task/api/streak.php";

  static Future<Map<String, dynamic>> fetchStreak() async {
    final res = await http.get(Uri.parse(url));

    if (res.statusCode != 200) {
      throw Exception("Server error");
    }

    return jsonDecode(res.body);
  }
}
