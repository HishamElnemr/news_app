import 'package:dio/dio.dart';
import 'package:news_app/models/news_model.dart';

class NewsService {
  final dio = Dio();

  Future<List<NewsModel>> getNewsServices({required String category}) async {
    try {
      final response = await dio.get(
          'https://newsapi.org/v2/top-headlines?country=us&category=$category&apiKey=3bdef46fc301458d8e6c215577c4b747');
      Map<String, dynamic> jsonData = response.data;
      List<dynamic> articles = jsonData['articles'];
      List<NewsModel> articlesList = [];
      for (var i in articles) {
        NewsModel newsModel = NewsModel.fromJson(i);
        articlesList.add(newsModel);
      }
      return articlesList;
    } on DioException catch (e) {
      final String errorMessage =
          e.response?.data['message'] ?? 'Unknown Error';
      throw Exception(errorMessage);
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
