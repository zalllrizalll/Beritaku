import 'package:beritaku/data/models/article.dart';
import 'package:beritaku/data/models/article_hive.dart';

extension ArticleMapper on Article {
  ArticleHive toHiveModel() {
    return ArticleHive(
      author: author,
      title: title,
      description: description,
      url: url,
      urlToImage: urlToImage,
      publishedAt: publishedAt.toIso8601String(),
      content: content,
      sourceName: source.name,
    );
  }
}

extension ArticleHiveMapper on ArticleHive {
  Article toArticleModel() {
    return Article(
      author: author,
      title: title ?? '',
      description: description,
      url: url ?? '',
      urlToImage: urlToImage,
      publishedAt: DateTime.parse(publishedAt.toString()),
      content: content,
      source: Source(id: null, name: sourceName ?? ''),
    );
  }
}
