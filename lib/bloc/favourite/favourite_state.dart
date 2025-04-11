part of 'favourite_bloc.dart';

sealed class FavouriteState extends Equatable {
  const FavouriteState();

  @override
  List<Object> get props => [];
}

final class FavouriteInitial extends FavouriteState {}

final class FavouriteLoading extends FavouriteState {}

final class FavouriteLoaded extends FavouriteState {
  final List<ArticleHive> articles;

  const FavouriteLoaded(this.articles);

  @override
  List<Object> get props => [articles];
}

final class FavouriteError extends FavouriteState {
  final String message;

  const FavouriteError(this.message);

  @override
  List<Object> get props => [message];
}
