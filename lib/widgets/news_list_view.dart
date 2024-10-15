import 'package:flutter/material.dart';
import 'package:news_app/models/news_model.dart';
import 'package:news_app/widgets/news_widget.dart';

class NewsListView extends StatelessWidget {
  const NewsListView({
    super.key,
    required this.newsModel, 
  });
  final List<NewsModel>? newsModel;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        physics: const BouncingScrollPhysics(),
        itemCount: newsModel?.length ?? 0,
        itemBuilder: (context, index) {
          if (newsModel != null && newsModel!.isNotEmpty) {
            return NewsWidget(newsModel: newsModel![index]);
          } else {
            return const Center(child: Text('No news available'));
          }
        },
      ),
    );
  }
}

