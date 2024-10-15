import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/cubits/news_cubit_states.dart';
import 'package:news_app/models/news_model.dart';
import 'package:news_app/services/news_services.dart';

class GetNewsCubit extends Cubit<NewsCubitStates> {
  GetNewsCubit() : super(NewsLoadedState());
  List<NewsModel>? newsModelList;
  String? activeCategory;
  Future<void> getNews({required String category}) async {
    try {
      emit(NoNewsState());
      activeCategory = category;
      newsModelList = await NewsService().getNewsServices(category: category);
      emit(NewsLoadedState(newsModel: newsModelList));
    } on Exception catch (e) {
      emit(NewsFailerdState(e.toString()));
    }
  }
}
