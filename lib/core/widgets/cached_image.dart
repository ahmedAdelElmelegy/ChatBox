import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class CachedImage extends StatelessWidget {
  final String image;
  final BoxFit? boxFit;
  const CachedImage({super.key, required this.image, this.boxFit});

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: image,
      fit: boxFit ?? BoxFit.fill,
      errorWidget: (context, url, error) => const Icon(Icons.error),
    );
  }
}
