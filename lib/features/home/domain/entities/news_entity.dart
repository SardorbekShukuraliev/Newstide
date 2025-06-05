import 'package:equatable/equatable.dart';

class NewsEntity extends Equatable {
  final String title;
  final String content;
  final String imageUrl;

  const NewsEntity({
    required this.title,
    required this.content,
    required this.imageUrl,
  });

  @override
  List<Object?> get props => [title, content, imageUrl];
}
