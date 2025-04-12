import 'package:beritaku/bloc/bottom_navigation/bottom_navigation_bloc.dart';
import 'package:beritaku/bloc/favourite/favourite_bloc.dart';
import 'package:beritaku/bloc/news/news_bloc.dart';
import 'package:beritaku/bloc/theme/theme_bloc.dart';
import 'package:beritaku/config/routes/navigation.dart';
import 'package:beritaku/data/datasource/api/news_api.dart';
import 'package:beritaku/data/models/article_hive.dart';
import 'package:beritaku/data/repository/news_repository.dart';
import 'package:beritaku/data/repository/theme_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/adapters.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    final navigation = Navigation();

    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider<ThemeRepository>(create: (_) => ThemeRepository()),
        RepositoryProvider<NewsRepository>(
          create: (_) => NewsRepository(NewsApi()),
        ),
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create:
                (context) =>
                    NewsBloc(RepositoryProvider.of<NewsRepository>(context)),
          ),
          BlocProvider(create: (_) => BottomNavigationBloc()),
          BlocProvider(
            create:
                (_) =>
                    FavouriteBloc(Hive.box<ArticleHive>('favourite_articles')),
          ),
          BlocProvider(
            create:
                (context) =>
                    ThemeBloc(RepositoryProvider.of<ThemeRepository>(context))
                      ..add(LoadThemeEvent()),
          ),
        ],
        child: AppView(navigation: navigation),
      ),
    );
  }
}

class AppView extends StatelessWidget {
  final Navigation navigation;
  const AppView({super.key, required this.navigation});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routerConfig: navigation.router,
      theme: ThemeData.light(),
      darkTheme: ThemeData.dark(),
      themeMode: context.watch<ThemeBloc>().state.themeMode,
    );
  }
}
