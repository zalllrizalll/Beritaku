import 'package:beritaku/config/constant/base_url.dart';
import 'package:beritaku/data/models/article.dart';
import 'package:beritaku/data/models/news_response.dart';
import 'package:dio/dio.dart';
import 'package:either_dart/either.dart';

class NewsApi {
  final dio = Dio(BaseOptions(baseUrl: BaseUrl.urlServer));

  Future<Either<String, List<Article>>> getArticles(String category) async {
    try {
      final response = await dio.get(
        '${BaseUrl.urlServer}/top-headlines?category=$category&apiKey=${BaseUrl.apiKey}',
      );

      if (response.statusCode != 200) {
        return Left(NewsResponse.fromJson(response.data).status);
      }

      return Right(NewsResponse.fromJson(response.data).articles);
    } catch (e) {
      return Left(e.toString());
    }
  }

  Future<Either<String, List<Article>>> getNews(String source) async {
    try {
      final response = await dio.get(
        '${BaseUrl.urlServer}/top-headlines?sources=$source&apiKey=${BaseUrl.apiKey}',
      );

      if (response.statusCode != 200) {
        return Left(NewsResponse.fromJson(response.data).status);
      }

      return Right(NewsResponse.fromJson(response.data).articles);
    } catch (e) {
      return Left(e.toString());
    }
  }

  Future<Either<String, List<Article>>> searchNews(
    String source,
    String query,
  ) async {
    try {
      final response = await dio.get(
        '${BaseUrl.urlServer}/top-headlines?sources=$source&q=$query&apiKey=${BaseUrl.apiKey}',
      );

      if (response.statusCode != 200) {
        return Left(NewsResponse.fromJson(response.data).status);
      }

      return Right(NewsResponse.fromJson(response.data).articles);
    } catch (e) {
      return Left(e.toString());
    }
  }
}
