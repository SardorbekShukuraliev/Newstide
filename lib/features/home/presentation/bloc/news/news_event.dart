import 'package:equatable/equatable.dart';

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
