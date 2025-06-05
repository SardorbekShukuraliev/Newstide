import 'package:Newstide/features/home/data/models/NewsModel.dart';
import 'package:Newstide/features/home/data/repositories/news_repository.dart';
import 'package:Newstide/features/home/presentation/bloc/news/news_bloc.dart';
import 'package:Newstide/features/home/presentation/bloc/news/news_event.dart';
import 'package:Newstide/features/home/presentation/bloc/news/news_state.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockNewsRepository extends Mock implements NewsRepository {}

void main() {
  late NewsBloc newsBloc;
  late MockNewsRepository mockRepository;

  setUp(() {
    mockRepository = MockNewsRepository();
    newsBloc = NewsBloc(mockRepository as NewsRepository);
  });

  tearDown(() {
    newsBloc.close();
  });

  test('Начальное состояние должно быть NewsLoading', () {
    expect(newsBloc.state, NewsLoading());
  });

  test('FetchNews загружает новости и меняет состояние на NewsLoaded', () async {
    final fakeNews = [NewsModel(title: 'Тестовая новость', content: 'Описание', imageUrl: '')];

    when(() => mockRepository.fetchNews(limit: any(named: 'limit'), offset: any(named: 'offset')))
        .thenAnswer((_) async => fakeNews);

    newsBloc.add(FetchNews());

    await expectLater(
      newsBloc.stream,
      emitsInOrder([
        NewsLoading(),
        NewsLoaded(news: fakeNews, hasReachedMax: true),
      ]),
    );
  });

  test('SearchNews загружает новости по запросу и меняет состояние', () async {
    final fakeNews = [NewsModel(title: 'Flutter', content: 'Описание', imageUrl: '')];

    when(() => mockRepository.searchNews('Flutter', limit: any(named: 'limit'), offset: any(named: 'offset')))
        .thenAnswer((_) async => fakeNews);

    newsBloc.add(SearchNews('Flutter'));

    await expectLater(
      newsBloc.stream,
      emitsInOrder([
        NewsLoading(),
        NewsLoaded(news: fakeNews, hasReachedMax: true),
      ]),
    );
  });

  test('Ошибка при загрузке новостей приводит к NewsError', () async {
    when(() => mockRepository.fetchNews(limit: any(named: 'limit'), offset: any(named: 'offset')))
        .thenThrow(Exception('Ошибка сервера'));

    newsBloc.add(FetchNews());

    await expectLater(
      newsBloc.stream,
      emitsInOrder([
        NewsLoading(),
        NewsError('Ошибка загрузки новостей.'),
      ]),
    );
  });
}
