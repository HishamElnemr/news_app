import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/constants.dart';
import 'package:news_app/cubits/get_news_cubit.dart';
import 'package:news_app/cubits/news_cubit_states.dart';
import 'package:news_app/views/news_view/news_view_widgets.dart';
import 'package:news_app/views/news_view/no_news_view.dart';

class NewsHomeView extends StatefulWidget {
  const NewsHomeView({super.key});
  static String id = 'NewsHomeView';

  @override
  State<NewsHomeView> createState() => _NewsHomeViewState();
}

class _NewsHomeViewState extends State<NewsHomeView> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<GetNewsCubit>(context).getNews(category: 'general');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<GetNewsCubit, NewsCubitStates>(
        builder: (context, state) {
          if (state is NewsLoadedState) {
            return NewsViewWigets(newsModel: state.newsModel);
          } else if (state is NoNewsState) {
            return const Center(
              child: CircularProgressIndicator(backgroundColor: Colors.amber,), 
            );
          } else {
            return NoNewsView();
          }
        },
      ),
      backgroundColor: kPrimaryColor,
    );
  }
}
