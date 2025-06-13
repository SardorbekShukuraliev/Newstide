import '../../domain/entities/news_entity.dart';

class NewsModel extends NewsEntity {
  const NewsModel({
    required super.title,
    required super.content,
    required super.imageUrl,
  });

  factory NewsModel.fromJson(Map<String, dynamic> json) {
    return NewsModel(
      title: json['title'] ?? 'no name',
      content: json['description'] ?? 'no description',
      imageUrl: json['urlToImage'] ?? '',
    );
  }
}
