import 'package:api_implementation/Data%20Provider%20From%20Server/data_provider.dart';
import 'package:api_implementation/Links.dart/links.dart';
import 'package:api_implementation/Model%20Classes/Engadget/Content.dart';
import 'package:api_implementation/Widgets/news_display_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TeslaNewsScreen extends StatefulWidget {
  const TeslaNewsScreen({super.key});

  @override
  State<TeslaNewsScreen> createState() => _TeslaNewsScreenState();
}

class _TeslaNewsScreenState extends State<TeslaNewsScreen> {
  @override
  void initState() {
    super.initState();
    Provider.of<NewsProvider>(context, listen: false)
        .fetchNews(NewsLinks.teslanewslink);
  }

  @override
  Widget build(BuildContext context) {
    final newsProvider = Provider.of<NewsProvider>(context);
    final news = newsProvider.currentNews;
    return Scaffold(
        appBar: AppBar(
            backgroundColor: const Color.fromARGB(255, 99, 69, 47),
            title: const Text("Tesla News"),
            automaticallyImplyLeading: false),
        body: NewsDisplayWidget(newss: news));
  }
}
