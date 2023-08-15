import 'package:http/http.dart' as http;
import 'dart:convert';

class NewsApi {
  static const String apiKey = '923450c02f43402d92ff828f24bf9afc';

  static Future<List<dynamic>> fetchNews() async {
    final response = await http.get(
      Uri.parse('https://newsapi.org/v2/top-headlines?country=us&apiKey=$apiKey'),
    );

    if (response.statusCode == 200) {
      final jsonData = json.decode(response.body);
      return jsonData['articles'];
    } else {
      throw Exception('Failed to load news');
    }
  }
}