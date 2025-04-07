part of 'news_bloc.dart';

sealed class NewsEvent extends Equatable {
  const NewsEvent();

  @override
  List<Object?> get props => [];
}

class GetArticleEvent extends NewsEvent {
  final String category;
  const GetArticleEvent(this.category);

  @override
  List<Object?> get props => [category];
}

class GetNewsEvent extends NewsEvent {
  final String source;
  const GetNewsEvent(this.source);

  @override
  List<Object?> get props => [source];
}

class SearchNewsEvent extends NewsEvent {
  final String source;
  final String query;
  const SearchNewsEvent(this.source, this.query);

  @override
  List<Object?> get props => [query];
}
