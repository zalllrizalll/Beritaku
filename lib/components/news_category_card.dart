import 'package:beritaku/data/models/news_category.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class NewsCategoryCard extends StatelessWidget {
  final NewsCategory newsCategory;
  VoidCallback? onTap;
  NewsCategoryCard({super.key, required this.newsCategory, this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
        child: Card(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: ConstrainedBox(
                  constraints: const BoxConstraints(
                    minWidth: 80,
                    minHeight: 80,
                    maxWidth: 80,
                    maxHeight: 80,
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Image.asset(
                      newsCategory.image,
                      fit: BoxFit.cover,
                      height: 20,
                      errorBuilder: (_, __, ___) {
                        return const Icon(
                          Icons.broken_image,
                          size: 30,
                          color: Colors.grey,
                        );
                      },
                    ),
                  ),
                ),
              ),
              const SizedBox.square(dimension: 12),
              Expanded(
                child: Text(
                  newsCategory.category,
                  style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
