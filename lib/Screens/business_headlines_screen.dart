import 'package:api_implementation/Data%20Provider%20From%20Server/data_provider.dart';
import 'package:api_implementation/Links.dart/links.dart';
import 'package:api_implementation/Widgets/news_display_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BusinessHeadlinesScreen extends StatefulWidget {
  const BusinessHeadlinesScreen({super.key});

  @override
  State<BusinessHeadlinesScreen> createState() =>
      _BusinessHeadlinesScreenState();
}

class _BusinessHeadlinesScreenState extends State<BusinessHeadlinesScreen> {
  @override
  void initState() {
    super.initState();
    // Load news data when the screen initializes
    Provider.of<NewsProvider>(context, listen: false)
        .fetchNews(NewsLinks.businessheadlineslink);
  }

  @override
  Widget build(BuildContext context) {
    final newsProvider = Provider.of<NewsProvider>(context);
    final news = newsProvider.currentNews;
    return Scaffold(
        appBar: AppBar(
            backgroundColor: const Color.fromARGB(255, 99, 69, 47),
            title: const Text("Top Business Headlines"),
            automaticallyImplyLeading: false),
        body: NewsDisplayWidget(newss: news));
  }
}
