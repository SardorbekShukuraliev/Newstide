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
      title: json['title'] ?? 'no name',
      content: json['description'] ?? 'no discription',
      imageUrl: json['urlToImage'] ?? '',
    );
  }

  @override
  List<Object?> get props => [title, content, imageUrl];
}
