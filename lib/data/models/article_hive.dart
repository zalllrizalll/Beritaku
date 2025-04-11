import 'package:hive_flutter/adapters.dart';

part 'article_hive.g.dart';

@HiveType(typeId: 1)
class ArticleHive extends HiveObject {
  @HiveField(0)
  String? title;

  @HiveField(1)
  String? description;

  @HiveField(2)
  String? urlToImage;

  @HiveField(3)
  String? url;

  @HiveField(4)
  String? content;

  @HiveField(5)
  String? publishedAt;

  @HiveField(6)
  String? author;

  @HiveField(7)
  String? sourceName;

  ArticleHive({
    this.title,
    this.description,
    this.urlToImage,
    this.url,
    this.content,
    this.publishedAt,
    this.author,
    this.sourceName,
  });
}
