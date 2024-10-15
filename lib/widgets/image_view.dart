import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:news_app/constants.dart';
import 'package:news_app/models/news_model.dart';

class ImageView extends StatelessWidget {
  const ImageView({
    super.key,
    required this.newsModel,
    required this.width,
    required this.height,
  });

  final NewsModel? newsModel;
  final double width;
  final double height;
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: CachedNetworkImage(
        imageUrl: newsModel?.img ?? 'assets/img.png',
        placeholder: (context, url) => CircularProgressIndicator(
          backgroundColor: Colors.amber,
          strokeWidth: 2.0,
          valueColor: AlwaysStoppedAnimation<Color>(kSecondColor),
        ),
        errorWidget: (context, url, error) =>
            Image.asset('assets/img.png', width: 120, height: 100),
        width: width,
        height: height,
        fit: BoxFit.cover,
      ),
    );
  }
}
