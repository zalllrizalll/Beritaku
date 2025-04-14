import 'package:beritaku/data/models/news_category.dart';

class NewsCategoryDummy {
  final List<NewsCategory> newsCategories = [
    NewsCategory(image: 'assets/vector/business.png', category: 'Business'),
    NewsCategory(
      image: 'assets/vector/entertainment.png',
      category: 'Entertainment',
    ),
    NewsCategory(image: 'assets/vector/general.png', category: 'General'),
    NewsCategory(image: 'assets/vector/health.png', category: 'Health'),
    NewsCategory(image: 'assets/vector/science.png', category: 'Science'),
    NewsCategory(image: 'assets/vector/sport.png', category: 'Sports'),
    NewsCategory(image: 'assets/vector/technology.png', category: 'Technology'),
  ];
}
