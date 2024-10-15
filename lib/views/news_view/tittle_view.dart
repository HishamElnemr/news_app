import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:news_app/constants.dart';
import 'package:news_app/models/news_model.dart';
import 'package:news_app/widgets/image_view.dart';

class TittleView extends StatelessWidget {
  const TittleView({super.key, this.newsModel});
  final NewsModel? newsModel;
  static String id = 'TittleView';
  @override
  Widget build(BuildContext context) {
    final String formattedTime =
        DateFormat('dd/MM/yyyy').format(newsModel!.update ?? DateTime.now());
    return Scaffold(
      backgroundColor: kPrimaryColor,
      appBar: AppBar(
        backgroundColor: Colors.amber,
        shadowColor: const Color.fromARGB(255, 163, 163, 163),
        elevation: 10,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20),
              ImageView(
                newsModel: newsModel,
                width: double.infinity,
                height: 200,
              ),
              const SizedBox(height: 30),
              Text(
                newsModel?.title ?? 'No Title',
                softWrap: true,
                style: const TextStyle(
                  fontSize: 21,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 20),
              Text(
                formattedTime,
                maxLines: 1,
                style: const TextStyle(
                  fontSize: 14,
                  color: kSecondColor,
                  height: 1.1,
                ),
                softWrap: true,
                overflow: TextOverflow.ellipsis,
              ),
              const SizedBox(height: 10),
              Text(
                newsModel?.author ?? 'Unknown',
                style: const TextStyle(
                  fontSize: 14,
                  color: kSecondColor,
                ),
              ),
              const SizedBox(height: 20),
              Text(
                newsModel?.description ?? 'No Description',
                style: const TextStyle(
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
