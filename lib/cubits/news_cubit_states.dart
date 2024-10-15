import 'package:news_app/models/news_model.dart';

class NewsCubitStates {}

class NewsLoadedState extends NewsCubitStates {
  List<NewsModel>? newsModel;
  NewsLoadedState({this.newsModel});
}

class NoNewsState extends NewsCubitStates {}

class NewsFailerdState extends NewsCubitStates {
  NewsFailerdState(String string);
}
