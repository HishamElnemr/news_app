import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/constants.dart';
import 'package:news_app/cubits/get_news_cubit.dart';
import 'package:news_app/cubits/news_cubit_states.dart';
import 'package:news_app/models/category_model.dart';

class CategoriesWidget extends StatelessWidget {
  const CategoriesWidget({
    super.key,
    required this.categoryModel,
  });
  final CategoryModel categoryModel;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        var categorie = BlocProvider.of<GetNewsCubit>(context);
        categorie.getNews(category: categoryModel.tittle);
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 5),
        child: IntrinsicWidth(
          // this make width as the text width
          child: BlocBuilder<GetNewsCubit, NewsCubitStates>(
            builder: (context, state) {
              var isActive =
                  BlocProvider.of<GetNewsCubit>(context).activeCategory ==
                      categoryModel.tittle;
              return Container(
                height: 50,
                constraints: const BoxConstraints(minWidth: 80),
                decoration: BoxDecoration(
                  color: isActive ? Colors.amber : kSecondColor,
                  borderRadius: BorderRadius.circular(50),
                ),
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Text(
                      categoryModel.tittle,
                      textAlign: TextAlign.center,
                      style:  TextStyle(
                        color: isActive ? Colors.black : Colors.white,
                        fontSize: 17,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
