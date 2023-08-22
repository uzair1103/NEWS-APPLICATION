import 'package:api_implementation/Data%20Provider%20From%20Server/data_provider.dart';
import 'package:api_implementation/Links.dart/links.dart';
import 'package:api_implementation/Model%20Classes/Engadget/Content.dart';
import 'package:api_implementation/Widget/news_display_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TechCrunchHeadlines extends StatefulWidget {
  const TechCrunchHeadlines({super.key});

  @override
  State<TechCrunchHeadlines> createState() => _TechCrunchHeadlinesState();
}

class _TechCrunchHeadlinesState extends State<TechCrunchHeadlines> {
  @override
  void initState() {
    super.initState();
    // Load news data when the screen initializes
    Provider.of<NewsProvider>(context, listen: false)
        .fetchNews(NewsLinks.techcrunchheadlineslink);
  }

  @override
  Widget build(BuildContext context) {
    final newsProvider = Provider.of<NewsProvider>(context);
    final news = newsProvider.currentNews;

    return Scaffold(
        appBar: AppBar(
            backgroundColor: Colors.blue,
            title: const Text("TechCrunch Headlines")),
        body: NewsDisplayWidget(newss: news));
  }
}
