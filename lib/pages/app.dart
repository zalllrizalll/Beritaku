import 'package:beritaku/bloc/bottom_navigation/bottom_navigation_bloc.dart';
import 'package:beritaku/bloc/favourite/favourite_bloc.dart';
import 'package:beritaku/bloc/news/news_bloc.dart';
import 'package:beritaku/config/routes/navigation.dart';
import 'package:beritaku/data/models/article_hive.dart';
import 'package:beritaku/data/repository/news_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/adapters.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create:
              (context) =>
                  NewsBloc(RepositoryProvider.of<NewsRepository>(context)),
        ),
        BlocProvider(create: (context) => BottomNavigationBloc()),
        BlocProvider(
          create:
              (context) =>
                  FavouriteBloc(Hive.box<ArticleHive>('favourite_articles')),
        ),
      ],
      child: const AppView(),
    );
  }
}

class AppView extends StatelessWidget {
  const AppView({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routerConfig: Navigation().router,
    );
  }
}
