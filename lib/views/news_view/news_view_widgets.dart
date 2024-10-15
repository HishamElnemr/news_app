import 'package:flutter/material.dart';
import 'package:news_app/constants.dart';
import 'package:news_app/widgets/categories_list_view.dart';
import 'package:news_app/widgets/news_app_bar.dart';
import 'package:news_app/widgets/news_list_view.dart';
import 'package:news_app/models/news_model.dart';

class NewsViewWigets extends StatelessWidget {
  const NewsViewWigets({
    super.key,
    required this.newsModel,
  });

  final List<NewsModel>? newsModel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimaryColor,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: SafeArea(
          child: Column(
            children: [
              NewsAppBar(),
              SizedBox(height: 10),
              CategoriesListView(),
              SizedBox(height: 10),
              Divider(
                color: kSecondColor,
                height: 20,
              ),
              NewsListView(newsModel: newsModel),
            ],
          ),
        ),
      ),
    );
  }
}
