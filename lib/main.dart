import 'package:flutter/material.dart';
import 'package:news_cloud/view_models/list_of_articles_view_model.dart';
import 'package:news_cloud/views/home_view.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const NewsCloud());
}

class NewsCloud extends StatelessWidget {
  const NewsCloud({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ArticleListViewModel()),
      ],
      child: MaterialApp(
        home: HomeView(),
      ),
    );
  }
}
