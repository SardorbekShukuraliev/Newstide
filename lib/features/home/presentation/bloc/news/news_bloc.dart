import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import '../../../data/models/NewsModel.dart';
import '../../../data/repositories/news_repository.dart';

abstract class NewsEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class FetchNews extends NewsEvent {}

class FetchMoreNews extends NewsEvent {}

class SearchNews extends NewsEvent {
  final String title;

  SearchNews(this.title);

  @override
  List<Object?> get props => [title];
}

class SearchMoreNews extends NewsEvent {
  final String title;

  SearchMoreNews(this.title);

  @override
  List<Object?> get props => [title];
}

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


class NewsBloc extends Bloc<NewsEvent, NewsState> {
  final NewsRepository repository;
  final int _limit = 6;
  int _offset = 0;

  NewsBloc(this.repository) : super(NewsLoading()) {
    on<FetchNews>((event, emit) async {
      emit(NewsLoading());
      try {
        _offset = 0;
        final news = await repository.fetchNews(limit: _limit, offset: _offset); // <--- Передаем limit и offset
        final hasReachedMax = news.length < _limit;
        emit(NewsLoaded(news: news, hasReachedMax: hasReachedMax));
      } catch (e) {
        emit(NewsError('Ошибка загрузки новостей.'));
      }
    });

    on<FetchMoreNews>((event, emit) async {
      final currentState = state;
      if (currentState is NewsLoaded && !currentState.hasReachedMax) {
        emit(NewsLoadingMore());
        _offset += _limit;
        try {
          final newNews = await repository.fetchNews(limit: _limit, offset: _offset); // <--- Передаем limit и offset
          final hasReachedMax = newNews.isEmpty;
          emit(currentState.copyWith(
            news: List.from(currentState.news)..addAll(newNews),
            hasReachedMax: hasReachedMax,
          ));
        } catch (e) {
          emit(NewsError('Ошибка при загрузке дополнительных новостей.'));
        }
      }
    });

    on<SearchNews>((event, emit) async {
      emit(NewsLoading());
      try {
        _offset = 0;
        final news = await repository.searchNews(event.title, limit: _limit, offset: _offset); // <--- Передаем limit и offset
        final hasReachedMax = news.length < _limit;
        emit(NewsLoaded(news: news, hasReachedMax: hasReachedMax));
      } catch (e) {
        emit(NewsError('Ошибка поиска новостей.'));
      }
    });

    on<SearchMoreNews>((event, emit) async {
      final currentState = state;
      if (currentState is NewsLoaded && !currentState.hasReachedMax) {
        emit(NewsLoadingMore());
        _offset += _limit;
        try {
          final newNews = await repository.searchNews(event.title, limit: _limit, offset: _offset); // <--- Передаем limit и offset
          final hasReachedMax = newNews.isEmpty;
          emit(currentState.copyWith(
            news: List.from(currentState.news)..addAll(newNews),
            hasReachedMax: hasReachedMax,
          ));
        } catch (e) {
          emit(NewsError('Ошибка при поиске дополнительных новостей.'));
        }
      }
    });
  }
}