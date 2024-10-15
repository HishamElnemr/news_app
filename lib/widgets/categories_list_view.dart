import 'package:flutter/material.dart';
import 'package:news_app/models/category_model.dart';
import 'package:news_app/widgets/categories_widget.dart';

class CategoriesListView extends StatelessWidget {
  CategoriesListView({super.key});
  final List<CategoryModel> categories = [
    CategoryModel(tittle: 'general'),
    CategoryModel(tittle: 'sports'),
    CategoryModel(tittle: 'business'),
    CategoryModel(tittle: 'entertainment'),
    CategoryModel(tittle: 'health'),
    CategoryModel(tittle: 'science'),
    CategoryModel(tittle: 'technology'),
  ];
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: ListView.builder(
        physics: const BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemCount: categories.length,
        itemBuilder: (context, index) {
          return CategoriesWidget(
            categoryModel: categories[index],
          );
        },
      ),
    );
  }
}
