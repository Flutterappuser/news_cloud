import 'package:flutter/material.dart';

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
        body: Container(),
      ),
    );
  }
}
