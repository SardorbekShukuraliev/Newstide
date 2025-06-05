import '../entities/news_entity.dart';

abstract class NewsRepository {
  Future<List<NewsEntity>> fetchNews({required int offset, required int limit});
  Future<List<NewsEntity>> searchNews(String title, {required int offset, required int limit});
}
