import 'package:beritaku/bloc/favourite/favourite_bloc.dart';
import 'package:beritaku/data/models/article.dart';
import 'package:beritaku/data/models/article_mapper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FavouriteIconWidget extends StatelessWidget {
  final Article article;
  const FavouriteIconWidget({super.key, required this.article});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FavouriteBloc, FavouriteState>(
      builder: (context, state) {
        bool isFavourite = false;

        if (state is FavouriteLoaded) {
          isFavourite = state.articles.any((e) => e.url == article.url);
        }

        return CircleAvatar(
          backgroundColor: Colors.grey.shade300,
          child: IconButton(
            onPressed: () {
              final bloc = context.read<FavouriteBloc>();
              final articleHive = article.toHiveModel();

              if (isFavourite) {
                bloc.add(RemoveFavouriteEvent(article.url));
              } else {
                bloc.add(AddFavouriteEvent(articleHive));
              }
            },
            icon: Icon(
              isFavourite ? Icons.favorite : Icons.favorite_border,
              color: Colors.red,
            ),
            color: Colors.red,
          ),
        );
      },
    );
  }
}
