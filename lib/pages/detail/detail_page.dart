import 'package:beritaku/components/body_detail_page.dart';
import 'package:beritaku/components/custom_button_widget.dart';
import 'package:beritaku/components/favourite_icon_widget.dart';
import 'package:beritaku/data/models/article.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class DetailPage extends StatefulWidget {
  final Article article;
  const DetailPage({super.key, required this.article});

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  Future<void> _launchUrl(String url) async {
    final Uri uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    } else {
      throw Exception('Could not launch $url');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Detail Article',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                ConstrainedBox(
                  constraints: const BoxConstraints(
                    minHeight: 200,
                    maxHeight: 300,
                    minWidth: double.infinity,
                    maxWidth: double.infinity,
                  ),
                  child: Image.network(
                    widget.article.urlToImage ?? '',
                    errorBuilder: (context, error, stackTrace) {
                      return const Icon(
                        Icons.broken_image,
                        size: 30,
                        color: Colors.grey,
                      );
                    },
                    fit: BoxFit.cover,
                    width: double.infinity,
                  ),
                ),
                Positioned(top: 15, right: 15, child: FavouriteIconWidget()),
              ],
            ),
            const SizedBox.square(dimension: 8),
            BodyDetailPage(article: widget.article),
          ],
        ),
      ),
      bottomNavigationBar: CustomButtonWidget(
        onPressed: () {
          _launchUrl(widget.article.url);
        },
      ),
    );
  }
}
