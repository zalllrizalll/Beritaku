import 'package:beritaku/data/models/article.dart';
import 'package:beritaku/data/repository/news_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

part 'news_event.dart';
part 'news_state.dart';

class NewsBloc extends Bloc<NewsEvent, NewsState> {
  final NewsRepository repository;

  NewsBloc(this.repository) : super(NewsInitial()) {
    on<GetArticleEvent>((event, emit) async {
      emit(NewsLoading());
      try {
        final result = await repository.fetchArticles(event.category);

        result.fold(
          (error) => emit(NewsError(error)),
          (articles) => emit(NewsLoaded(articles)),
        );
      } catch (e) {
        emit(NewsError(e.toString()));
      }
    });

    on<GetNewsEvent>((event, emit) async {
      emit(NewsLoading());
      try {
        final result = await repository.fetchNews(event.source);

        result.fold(
          (error) => emit(NewsError(error)),
          (articles) => emit(NewsLoaded(articles)),
        );
      } catch (e) {
        emit(NewsError(e.toString()));
      }
    });

    on<SearchNewsEvent>((event, emit) async {
      emit(NewsLoading());
      try {
        final result = await repository.searchNews(event.source, event.query);

        result.fold(
          (error) => emit(NewsError(error)),
          (articles) => emit(NewsLoaded(articles)),
        );
      } catch (e) {
        emit(NewsError(e.toString()));
      }
    });
  }
}
