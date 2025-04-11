import 'package:beritaku/bloc/news/news_bloc.dart';
import 'package:beritaku/components/news_article_card.dart';
import 'package:beritaku/data/datasource/api/news_api.dart';
import 'package:beritaku/data/repository/news_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class ArticlePage extends StatefulWidget {
  final String category;
  const ArticlePage({super.key, required this.category});

  @override
  State<ArticlePage> createState() => _ArticlePageState();
}

class _ArticlePageState extends State<ArticlePage> {
  late final NewsBloc newsBloc;

  @override
  void initState() {
    super.initState();

    final repository = NewsRepository(NewsApi());
    newsBloc = NewsBloc(repository)..add(GetArticleEvent(widget.category));
  }

  @override
  void dispose() {
    super.dispose();
    newsBloc.close();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Article Sources',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),
      body: BlocBuilder<NewsBloc, NewsState>(
        bloc: newsBloc,
        builder: (context, state) {
          if (state is NewsLoading) {
            return const Center(
              child: CircularProgressIndicator(color: Colors.blue),
            );
          } else if (state is NewsLoaded) {
            final uniqueArticles =
                state.articles
                    .map((e) => e.source.name)
                    .whereType<String>()
                    .toSet()
                    .toList();

            return ListView.builder(
              itemCount: uniqueArticles.length,
              itemBuilder: (context, index) {
                final article = state.articles.firstWhere(
                  (element) => element.source.name == uniqueArticles[index],
                );

                return NewsArticleCard(
                  article: article,
                  onTap: () async {
                    await context.pushNamed('news', extra: article.source.id);
                  },
                );
              },
            );
          } else if (state is NewsError) {
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
                'No articles found',
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
