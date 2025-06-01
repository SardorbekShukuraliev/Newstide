import 'package:equatable/equatable.dart';

class NewsModel extends Equatable {
  final String title;
  final String content;
  final String imageUrl;

  const NewsModel({
    required this.title,
    required this.content,
    required this.imageUrl,
  });

  factory NewsModel.fromJson(Map<String, dynamic> json) {
    return NewsModel(
      title: json['title'] ?? 'Без названия',
      content: json['description'] ?? 'Нет описания',
      imageUrl: json['urlToImage'] ?? '',
    );
  }

  @override
  List<Object?> get props => [title, content, imageUrl];
}
