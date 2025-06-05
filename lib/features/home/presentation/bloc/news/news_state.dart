import 'package:equatable/equatable.dart';
import '../../../data/models/NewsModel.dart';

abstract class NewsState extends Equatable {
  @override
  List<Object?> get props => [];
}

class NewsLoading extends NewsState {}

class NewsLoaded extends NewsState {
  final List<NewsModel> news;
  final bool hasReachedMax;

  NewsLoaded({required this.news, this.hasReachedMax = false});

  NewsLoaded copyWith({List<NewsModel>? news, bool? hasReachedMax}) {
    return NewsLoaded(
      news: news ?? this.news,
      hasReachedMax: hasReachedMax ?? this.hasReachedMax,
    );
  }

  @override
  List<Object?> get props => [news, hasReachedMax];
}

class NewsLoadingMore extends NewsState {}

class NewsError extends NewsState {
  final String message;
  NewsError(this.message);
}
