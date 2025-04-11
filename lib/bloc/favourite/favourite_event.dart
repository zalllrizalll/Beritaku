part of 'favourite_bloc.dart';

sealed class FavouriteEvent extends Equatable {
  const FavouriteEvent();

  @override
  List<Object> get props => [];
}

final class LoadFavouriteEvent extends FavouriteEvent {}

final class AddFavouriteEvent extends FavouriteEvent {
  final ArticleHive article;

  const AddFavouriteEvent(this.article);

  @override
  List<Object> get props => [article];
}

final class RemoveFavouriteEvent extends FavouriteEvent {
  final String url;

  const RemoveFavouriteEvent(this.url);

  @override
  List<Object> get props => [url];
}
