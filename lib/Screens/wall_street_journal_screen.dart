import 'package:api_implementation/Data%20Provider%20From%20Server/data_provider.dart';
import 'package:api_implementation/Links.dart/links.dart';
import 'package:api_implementation/Model%20Classes/Engadget/Content.dart';
import 'package:api_implementation/Widgets/news_display_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class WallStreetJournalScreen extends StatefulWidget {
  const WallStreetJournalScreen({super.key});

  @override
  State<WallStreetJournalScreen> createState() =>
      _WallStreetJournalScreenState();
}

class _WallStreetJournalScreenState extends State<WallStreetJournalScreen> {
  @override
  void initState() {
    super.initState();
    Provider.of<NewsProvider>(context, listen: false)
        .fetchNews(NewsLinks.wallstreetjournallink);
  }

  @override
  Widget build(BuildContext context) {
    final newsProvider = Provider.of<NewsProvider>(context);
    final news = newsProvider.currentNews;
    return Scaffold(
        appBar: AppBar(
            backgroundColor: const Color.fromARGB(255, 99, 69, 47),
            title: const Text(
              "Articles by Wall Street Journal",
              style: TextStyle(fontSize: 18),
            ),
            automaticallyImplyLeading: false),
        body: NewsDisplayWidget(newss: news));
  }
}
