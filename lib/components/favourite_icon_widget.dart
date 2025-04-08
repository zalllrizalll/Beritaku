import 'package:flutter/material.dart';

class FavouriteIconWidget extends StatelessWidget {
  const FavouriteIconWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      backgroundColor: Colors.grey.shade300,
      child: IconButton(
        onPressed: () {},
        icon: const Icon(Icons.favorite_outline_rounded),
        color: Colors.red,
      ),
    );
  }
}
