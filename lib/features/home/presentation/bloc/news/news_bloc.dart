import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../data/repositories/news_repository.dart';
import 'news_event.dart';
import 'news_state.dart';

class NewsBloc extends Bloc<NewsEvent, NewsState> {
  final NewsRepository repository;
  final int _limit = 6;
  int _offset = 0;

  NewsBloc(this.repository) : super(NewsLoading()) {
    on<FetchNews>((event, emit) async {
      emit(NewsLoading());
      try {
        _offset = 0;
        final news = await repository.fetchNews(limit: _limit, offset: _offset);
        final hasReachedMax = news.length < _limit;
        emit(NewsLoaded(news: news, hasReachedMax: hasReachedMax));
      } catch (_) {
        emit(NewsError('error on loading news'));
      }
    });

    on<FetchMoreNews>((event, emit) async {
      final currentState = state;
      if (currentState is NewsLoaded && !currentState.hasReachedMax) {
        emit(NewsLoadingMore());
        _offset += _limit;
        try {
          final newNews = await repository.fetchNews(limit: _limit, offset: _offset);
          final hasReachedMax = newNews.isEmpty;
          emit(currentState.copyWith(
            news: List.from(currentState.news)..addAll(newNews),
            hasReachedMax: hasReachedMax,
          ));
        } catch (_) {
          emit(NewsError('searching error'));
        }
      }
    });

    on<SearchNews>((event, emit) async {
      emit(NewsLoading());
      try {
        _offset = 0;
        final news = await repository.searchNews(event.title, limit: _limit, offset: _offset);
        final hasReachedMax = news.length < _limit;
        emit(NewsLoaded(news: news, hasReachedMax: hasReachedMax));
      } catch (_) {
        emit(NewsError('Searching error'));
      }
    });

    on<SearchMoreNews>((event, emit) async {
      final currentState = state;
      if (currentState is NewsLoaded && !currentState.hasReachedMax) {
        emit(NewsLoadingMore());
        _offset += _limit;
        try {
          final newNews = await repository.searchNews(event.title, limit: _limit, offset: _offset);
          final hasReachedMax = newNews.isEmpty;
          emit(currentState.copyWith(
            news: List.from(currentState.news)..addAll(newNews),
            hasReachedMax: hasReachedMax,
          ));
        } catch (_) {
          emit(NewsError('loading error'));
        }
      }
    });
  }
}
