import 'package:beritaku/data/models/article.dart';
import 'package:flutter/material.dart';

class NewsArticleCard extends StatelessWidget {
  final Article article;
  VoidCallback? onTap;
  NewsArticleCard({super.key, required this.article, this.onTap});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: GestureDetector(
        onTap: onTap,
        child: Card(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          child: ListTile(
            leading: const Icon(Icons.article, size: 40, color: Colors.blue),
            title: Text(
              article.source.name,
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
          ),
        ),
      ),
    );
  }
}
