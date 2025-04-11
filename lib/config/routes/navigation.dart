import 'package:beritaku/data/models/article.dart';
import 'package:beritaku/pages/article/article_page.dart';
import 'package:beritaku/pages/favourite/favourite_page.dart';
import 'package:beritaku/pages/bottom_navigation/bottom_navigation_page.dart';
import 'package:beritaku/pages/detail/detail_page.dart';
import 'package:beritaku/pages/home/home_page.dart';
import 'package:beritaku/pages/news/news_page.dart';
import 'package:go_router/go_router.dart';

class Navigation {
  final _router = GoRouter(
    initialLocation: '/',
    routes: [
      ShellRoute(
        builder: (context, state, child) => BottomNavigationPage(child: child),
        routes: [
          GoRoute(
            name: 'home',
            path: '/',
            builder: (context, state) => const HomePage(),
          ),
          GoRoute(
            name: 'favourite',
            path: '/favourite',
            builder: (context, state) {
              return const FavouritePage();
            },
          ),
        ],
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
      GoRoute(
        name: 'detail',
        path: '/detail',
        builder: (context, state) {
          final article = state.extra as Article?;
          return DetailPage(article: article!);
        },
      ),
    ],
  );

  GoRouter get router => _router;
}
