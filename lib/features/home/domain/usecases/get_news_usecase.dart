import 'package:Newstide/features/home/data/models/NewsModel.dart';
import '../../data/repositories/news_repository.dart';


class GetNewsUseCase {
  final NewsRepository repository;

  GetNewsUseCase(this.repository);

  Future<List<NewsModel>> execute({required int offset, required int limit}) {
    return repository.fetchNews(offset: offset, limit: limit);
  }
}
