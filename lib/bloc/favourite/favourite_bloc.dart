import 'package:beritaku/data/models/article_hive.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:hive_flutter/adapters.dart';

part 'favourite_event.dart';
part 'favourite_state.dart';

class FavouriteBloc extends Bloc<FavouriteEvent, FavouriteState> {
  final Box<ArticleHive> favouriteBox;

  FavouriteBloc(this.favouriteBox) : super(FavouriteInitial()) {
    on<LoadFavouriteEvent>((event, emit) {
      emit(FavouriteLoading());
      try {
        final articles = favouriteBox.values.toList();
        emit(FavouriteLoaded(articles));
      } catch (e) {
        emit(FavouriteError(e.toString()));
      }
    });

    on<AddFavouriteEvent>((event, emit) async {
      try {
        await favouriteBox.put(event.article.url, event.article);
        add(LoadFavouriteEvent());
      } catch (e) {
        emit(FavouriteError(e.toString()));
      }
    });

    on<RemoveFavouriteEvent>((event, emit) async {
      try {
        await favouriteBox.delete(event.url);
        add(LoadFavouriteEvent());
      } catch (e) {
        emit(FavouriteError(e.toString()));
      }
    });
  }
}
