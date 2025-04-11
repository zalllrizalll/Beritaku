import 'package:beritaku/data/datasource/api/news_api.dart';
import 'package:beritaku/data/models/article.dart';
import 'package:either_dart/either.dart';

class NewsRepository {
  final NewsApi dataSource;

  NewsRepository(this.dataSource);

  Future<Either<String, List<Article>>> fetchArticles(String category) async {
    return await dataSource.getArticles(category);
  }

  Future<Either<String, List<Article>>> fetchNews(String source) async {
    return await dataSource.getNews(source);
  }

  Future<Either<String, List<Article>>> searchNews(
    String source,
    String query,
  ) async {
    return await dataSource.searchNews(source, query);
  }
}
