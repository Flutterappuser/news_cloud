import 'package:flutter/material.dart';
import 'package:news_cloud/view_models/list_of_articles_view_model.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  void initState() {
    Provider.of<ArticleListViewModel>(context, listen: false).fetchArticles();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('News'),
      ),
      body: Consumer<ArticleListViewModel>(
        builder: (context, viewModel, _) {
          if (viewModel.articlesList.isEmpty) {
            // Show a loading indicator if the list is empty
            return Center(child: CircularProgressIndicator());
          } else {
            // Show the list of articles
            return ListView.builder(
              itemCount: viewModel.articlesList.length,
              itemBuilder: (context, index) {
                final article = viewModel.articlesList[index];
                final Uri _url = Uri.parse(article.imageUrl!);
                Future<void> _launchUrl() async {
                  if (!await launchUrl(_url)) {
                    throw Exception('Could not launch $_url');
                  }
                }

                return ListTile(
                  onTap: _launchUrl,
                  title: article.title == null
                      ? Text('Untitled')
                      : Text(article.title!),
                  subtitle: article.description == null
                      ? Text('No description')
                      : Text(article.description!),
                  leading: article.urlToImage == null
                      ? Icon(Icons.image_not_supported)
                      : Image.network(
                          article.urlToImage ?? '',
                          fit: BoxFit.cover,
                          height: 200,
                        ),
                );
              },
            );
          }
        },
      ),
    );
  }
}
