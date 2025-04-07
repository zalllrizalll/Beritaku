import 'package:beritaku/bloc/news/news_bloc.dart';
import 'package:beritaku/components/news_card.dart';
import 'package:beritaku/components/search_bar_custom.dart';
import 'package:beritaku/data/datasource/news_datasource.dart';
import 'package:beritaku/data/repository/news_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NewsPage extends StatefulWidget {
  final String source;
  const NewsPage({super.key, required this.source});

  @override
  State<NewsPage> createState() => _NewsPageState();
}

class _NewsPageState extends State<NewsPage> {
  late final NewsBloc newsBloc;

  @override
  void initState() {
    super.initState();

    final repository = NewsRepository(NewsDatasource());
    newsBloc = NewsBloc(repository)..add(GetNewsEvent(widget.source));
  }

  @override
  void dispose() {
    super.dispose();
    newsBloc.close();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: newsBloc,
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            'News',
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
          centerTitle: true,
          backgroundColor: Colors.blue,
        ),
        body: Column(
          children: [
            SearchBarCustom(
              onQueryChanged: (query) {
                if (query.isNotEmpty) {
                  newsBloc.add(SearchNewsEvent(widget.source, query));
                } else {
                  newsBloc.add(GetNewsEvent(widget.source));
                }
              },
            ),
            Expanded(
              child: BlocBuilder<NewsBloc, NewsState>(
                builder: (context, state) {
                  if (state is NewsLoading) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (state is NewsLoaded) {
                    if (state.articles.isEmpty) {
                      return const Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.error_outline_rounded,
                              size: 50,
                              color: Colors.red,
                            ),
                            SizedBox.square(dimension: 6),
                            Text(
                              'No results found',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Colors.red,
                              ),
                            ),
                          ],
                        ),
                      );
                    }

                    return ListView.builder(
                      itemCount: state.articles.length,
                      itemBuilder: (context, index) {
                        final news = state.articles[index];

                        return NewsCard(article: news);
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
            ),
          ],
        ),
      ),
    );
  }
}
