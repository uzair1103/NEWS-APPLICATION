import 'package:api_implementation/Links.dart/links.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart'; // Import the provider package
import '../Data Provider From Server/data_provider.dart';
import '../Widget/news_display_widget.dart';

class AppleNewsScreen extends StatefulWidget {
  const AppleNewsScreen({super.key});

  @override
  State<AppleNewsScreen> createState() => _AppleNewsScreenState();
}

class _AppleNewsScreenState extends State<AppleNewsScreen> {
  @override
  void initState() {
    super.initState();
    // Load news data when the screen initializes
    Provider.of<NewsProvider>(context, listen: false)
        .fetchNews(NewsLinks.applenewslink);
  }

  @override
  Widget build(BuildContext context) {
    final newsProvider = Provider.of<NewsProvider>(context);
    final news = newsProvider.currentNews;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text("Apple News"),
      ),
      body: NewsDisplayWidget(newss: news),
    );
  }
}
