import 'package:beritaku/pages/article/article_page.dart';
import 'package:beritaku/pages/home/home_page.dart';
import 'package:beritaku/pages/news/news_page.dart';
import 'package:go_router/go_router.dart';

class Navigation {
  final _router = GoRouter(
    routes: [
      GoRoute(
        name: 'home',
        path: '/',
        builder: (context, state) => const HomePage(),
      ),
      GoRoute(
        name: 'article',
        path: '/article',
        builder: (context, state) {
          final category = state.extra as String?;
          return ArticlePage(category: category ?? '');
        },
      ),
      GoRoute(
        name: 'news',
        path: '/news',
        builder: (context, state) {
          final source = state.extra as String?;
          return NewsPage(source: source ?? '');
        },
      ),
    ],
  );

  GoRouter get router => _router;
}
