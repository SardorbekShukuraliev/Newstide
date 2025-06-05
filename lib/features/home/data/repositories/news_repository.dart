import 'package:dio/dio.dart';
import '../models/NewsModel.dart';

class NewsRepository {
  final Dio _dio = Dio();
  final String _baseUrl = "https://newsapi.org/v2/everything";
  final String _apiKey = "b31c508171594c61958a9e4ac3df21f1";

  Future<List<NewsModel>> fetchNews({required int offset, required int limit}) async {
    try {
      final response = await _dio.get(_baseUrl, queryParameters: {
        'q': 'News',
        'apiKey': _apiKey,
      });

      if (response.statusCode == 200) {
        List articles = response.data['articles'] ?? [];
        return articles.map((json) => NewsModel.fromJson(json)).toList();
      } else {
        throw Exception('error fetching news: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('error in connection api: $e');
    }
  }

  Future<List<NewsModel>> searchNews(String title, {required int offset, required int limit}) async {
    try {
      final response = await _dio.get(_baseUrl, queryParameters: {
        'q': title.trim(),
        'apiKey': _apiKey,
        'searchIn': 'title,content',
      });

      if (response.statusCode == 200) {
        List articles = response.data['articles'] ?? [];
        return articles.map((json) => NewsModel.fromJson(json)).toList();
      } else {
        throw Exception('error fetching news: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception(' search error: $e');
    }
  }
}
