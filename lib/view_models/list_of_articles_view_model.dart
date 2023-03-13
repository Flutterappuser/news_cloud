import 'package:flutter/cupertino.dart';
import 'package:news_cloud/services/news_service.dart';
import '../models/article_model.dart';

class ArticleListViewModel extends ChangeNotifier {
  List<Article> _articlesList = [];
  List<Article> _articlesListByCategory = [];

  List<Article> get articlesList => _articlesList;
  List<Article> get articlesListByCategory => _articlesListByCategory;

  Future<void> fetchArticles() async {
    _articlesList = await NewsApi().fetchArticles()!;
    notifyListeners();
  }

  Future<void> fetchArticleByCategory(String category) async {
    _articlesListByCategory = await NewsApi().fetchCategoryArticles(category)!;
    notifyListeners();
  }
}
