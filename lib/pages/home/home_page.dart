import 'package:beritaku/components/news_category_card.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../data/dummy/news_category_dummy.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final NewsCategoryDummy category = NewsCategoryDummy();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Beritaku',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),
      body: ListView.builder(
        itemCount: category.newsCategories.length,
        itemBuilder: (context, index) {
          final newsCategory = category.newsCategories[index];

          return NewsCategoryCard(
            newsCategory: newsCategory,
            onTap: () async {
              await context.pushNamed('article', extra: newsCategory.category);
            },
          );
        },
      ),
    );
  }
}
