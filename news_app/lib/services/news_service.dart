import 'package:dio/dio.dart';
import 'package:news_app/models/article_model.dart';

class NewsService {
//   final Dio dio;
//   NewsService(this.dio);
//   Future<List<ArticleModel>> getNews() async {
//     try {
//       Response response = await dio.get(
//           'https://newsapi.org/v2/top-headlines?country=us&apiKey=b062fc7d01c9419f958511387ffb5519');
//       Map<String, dynamic> jsonData = response.data;
//       List<dynamic> articles = jsonData['articles'];
//       List<ArticleModel> articlesList = [];
//       for (Map article in articles) {
//         ArticleModel articleModel = ArticleModel(
//             image: article['urlToImage'],
//             title: article['title'],
//             subTitle: article['description']);
//         articlesList.add(articleModel);
//       }
//       //print(articlesList[1].image);
//       return articlesList;
//     } catch (e) {
//       return [];
//     }
//   }
  final Dio dio;

  NewsService(this.dio);

  Future<List<ArticleModel>> getTopHeadlines({required String category}) async {
    try {
      var response = await dio.get(
          'https://newsapi.org/v2/top-headlines?country=us&apiKey=3c88955c487e4d9db668f011dd85e737&category=$category');

      Map<String, dynamic> jsonData = response.data;

      List<dynamic> articles = jsonData['articles'];

      List<ArticleModel> articlesList = [];

      for (Map article in articles) {
        ArticleModel articleModel = ArticleModel(
          image: article['urlToImage'],
          title: article['title'],
          subTitle: article['description'],
          url: article['url'],
        );
        articlesList.add(articleModel);
      }

      return articlesList;
    } catch (e) {
      return [];
    }
  }
}
