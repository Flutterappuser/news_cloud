import 'dart:convert';

import 'package:news_cloud/models/article_model.dart';
import 'package:http/http.dart' as http;
import 'package:news_cloud/models/articles_models.dart';

class NewsApi {
  final String apiKey = '36479e94e45240c4b564463b32061aff';
  Future<List<Article>>? fetchArticles() async {
    try {
      http.Response response = await http.get(Uri.parse(
          'https://newsapi.org/v2/top-headlines?country=eg&apiKey=$apiKey'));
      if (response.statusCode == 200) {
        String data = response.body;
        var jsonData = jsonDecode(data);
        Articles articles = Articles.fromJson(jsonData);
        List<Article> articlesList =
            articles.articles.map((e) => Article.fromJson(e)).toList();
        return articlesList;
      } else {
        print('status code = ${response.statusCode}');
        return <Article>[];
      }
    } catch (ex) {
      print(ex);
      return <Article>[];
    }
  }
}
