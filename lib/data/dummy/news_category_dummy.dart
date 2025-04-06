import 'package:beritaku/data/models/news_category.dart';

class NewsCategoryDummy {
  final List<NewsCategory> newsCategories = [
    NewsCategory(image: 'assets/vector/business.svg', category: 'Business'),
    NewsCategory(
      image: 'assets/vector/entertainment.svg',
      category: 'Entertainment',
    ),
    NewsCategory(image: 'assets/vector/general.svg', category: 'General'),
    NewsCategory(image: 'assets/vector/health.svg', category: 'Health'),
    NewsCategory(image: 'assets/vector/science.svg', category: 'Science'),
    NewsCategory(image: 'assets/vector/sport.svg', category: 'Sports'),
    NewsCategory(image: 'assets/vector/technology.svg', category: 'Technology'),
  ];
}
