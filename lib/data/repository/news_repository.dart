import 'package:beritaku/data/datasource/news_datasource.dart';
import 'package:beritaku/data/models/article.dart';
import 'package:either_dart/either.dart';

class NewsRepository {
  final NewsDatasource dataSource;

  NewsRepository(this.dataSource);

  Future<Either<String, List<Article>>> fetchArticles(String category) async {
    return await dataSource.getArticles(category);
  }

  Future<Either<String, List<Article>>> fetchNews(String source) async {
    return await dataSource.getNews(source);
  }
}
