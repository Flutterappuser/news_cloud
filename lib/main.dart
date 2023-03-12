import 'package:flutter/material.dart';
import 'services/news_service.dart';

void main() {
  runApp(const NewsCloud());
}

class NewsCloud extends StatelessWidget {
  const NewsCloud({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'News Cloud',
      home: Scaffold(
        body: GestureDetector(
            onTap: (() async {
              NewsApi newsApi = NewsApi();
              var articles = await newsApi.fetchCategoryArticles('science');
              for (var article in articles!) {
                print(article.title);
              }
            }),
            child: Center(
                child: Container(
              child: Text('fetch data'),
            ))),
      ),
    );
  }
}
