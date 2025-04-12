import 'package:beritaku/bloc/favourite/favourite_bloc.dart';
import 'package:beritaku/data/models/article_hive.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BodyFavouritePage extends StatelessWidget {
  final ArticleHive article;
  VoidCallback? onTap;
  BodyFavouritePage({super.key, required this.article, this.onTap});

  @override
  Widget build(BuildContext context) {
    final favouriteBloc = context.read<FavouriteBloc>();

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
      child: GestureDetector(
        onTap: onTap,
        child: Card(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          child: ListTile(
            leading:
                article.urlToImage != null
                    ? ConstrainedBox(
                      constraints: const BoxConstraints(
                        minHeight: 60,
                        minWidth: 60,
                        maxHeight: 60,
                        maxWidth: 60,
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: Image.network(
                          article.urlToImage!,
                          fit: BoxFit.cover,
                          errorBuilder: (context, error, stackTrace) {
                            return const Icon(
                              Icons.broken_image,
                              size: 30,
                              color: Colors.grey,
                            );
                          },
                        ),
                      ),
                    )
                    : const Icon(
                      Icons.image_not_supported,
                      size: 30,
                      color: Colors.grey,
                    ),
            title: Text(
              article.title ?? 'No title',
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              maxLines: 2,
            ),
            subtitle: Text(
              article.description ?? 'No description',
              style: const TextStyle(fontSize: 14, color: Colors.grey),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            trailing: IconButton(
              icon: Icon(Icons.delete, color: Colors.red),
              onPressed: () {
                favouriteBloc.add(RemoveFavouriteEvent(article.url!));
              },
            ),
          ),
        ),
      ),
    );
  }
}
