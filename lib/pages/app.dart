import 'package:beritaku/bloc/news/news_bloc.dart';
import 'package:beritaku/config/routes/navigation.dart';
import 'package:beritaku/data/repository/news_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
      ],
      child: const AppView(),
    );
  }
}

class AppView extends StatelessWidget {
  const AppView({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(routerConfig: Navigation().router);
  }
}
