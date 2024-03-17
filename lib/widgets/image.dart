import 'package:app_github_connection/helper/extintion.dart';
import 'package:flutter/material.dart';

class ImageView extends StatelessWidget {
  const ImageView({super.key});

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      "assets/fair.jpeg",
      height: context.getHeight() / 3,
      width: context.getWidth() * 0.70,
      fit: BoxFit.cover,
      errorBuilder: (context, error, stackTrace) {
        return Image.network(
          "https://images.pexels.com/photos/949592/pexels-photo-949592.jpeg",
          height: context.getHeight() / 3,
          width: context.getWidth() * 0.70,
          fit: BoxFit.cover,
          loadingBuilder: (context, child, loadingProgress) {
            if (loadingProgress == null) return child;
            return Center(
              child: CircularProgressIndicator(
                value: loadingProgress.expectedTotalBytes != null
                    ? loadingProgress.cumulativeBytesLoaded /
                        loadingProgress.expectedTotalBytes!
                    : null,
              ),
            );
          },
        );
      },
    );
  }
}
