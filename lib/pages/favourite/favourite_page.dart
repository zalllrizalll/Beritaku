import 'package:beritaku/bloc/favourite/favourite_bloc.dart';
import 'package:beritaku/components/body_favourite_page.dart';
import 'package:beritaku/data/models/article_mapper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class FavouritePage extends StatefulWidget {
  const FavouritePage({super.key});

  @override
  State<FavouritePage> createState() => _FavouritePageState();
}

class _FavouritePageState extends State<FavouritePage> {
  late final FavouriteBloc favouriteBloc;

  @override
  void initState() {
    super.initState();

    favouriteBloc = context.read<FavouriteBloc>();
    favouriteBloc.add(LoadFavouriteEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Favourite Articles',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),
      body: BlocBuilder<FavouriteBloc, FavouriteState>(
        bloc: favouriteBloc,
        builder: (context, state) {
          if (state is FavouriteLoading) {
            return const Center(
              child: CircularProgressIndicator(color: Colors.blue),
            );
          } else if (state is FavouriteLoaded) {
            if (state.articles.isEmpty) {
              return const Center(
                child: Text(
                  'No Results Found',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.black54,
                  ),
                ),
              );
            }

            return ListView.builder(
              itemCount: state.articles.length,
              itemBuilder: (context, index) {
                final article = state.articles[index];

                return BodyFavouritePage(
                  article: article,
                  onTap: () async {
                    await context.pushNamed(
                      'detail',
                      extra: article.toArticleModel(),
                    );
                  },
                );
              },
            );
          } else if (state is FavouriteError) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    state.message.contains('Failed host lookup') ||
                            state.message.contains('SocketException')
                        ? const Icon(
                          Icons.signal_wifi_off,
                          size: 50,
                          color: Colors.red,
                        )
                        : const Icon(
                          Icons.error_outline,
                          size: 50,
                          color: Colors.red,
                        ),
                    const SizedBox.square(dimension: 12),
                    Text(
                      state.message.contains('Failed host lookup') ||
                              state.message.contains('SocketException')
                          ? 'No Internet Connection'
                          : 'Something went wrong',
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.red,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
            );
          } else {
            return const Center(
              child: Text(
                'No Results Found',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.black54,
                ),
              ),
            );
          }
        },
      ),
    );
  }
}
