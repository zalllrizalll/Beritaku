import 'package:beritaku/data/models/article.dart';
import 'package:beritaku/utils/date_helper.dart';
import 'package:flutter/material.dart';

class BodyDetailPage extends StatelessWidget {
  final Article article;
  const BodyDetailPage({super.key, required this.article});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Column(
        spacing: 8,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            article.title,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
            textAlign: TextAlign.justify,
          ),
          Text(
            article.content ?? 'No content',
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w400,
              color: Colors.black54,
            ),
            textAlign: TextAlign.justify,
          ),
          Divider(color: Colors.grey, height: 1),
          Row(
            spacing: 8,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const Icon(
                Icons.calendar_month_rounded,
                color: Colors.blue,
                size: 24,
              ),
              Text(
                DateHelper.formatDate(article.publishedAt.toString()),
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: Colors.black,
                ),
              ),
            ],
          ),
          Row(
            spacing: 8,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const Icon(Icons.person, color: Colors.blue, size: 24),
              Text(
                article.author ?? 'No author',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: Colors.black,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
