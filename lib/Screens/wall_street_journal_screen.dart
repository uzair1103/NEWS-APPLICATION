import 'package:api_implementation/Data%20Provider%20From%20Server/data_provider.dart';
import 'package:api_implementation/Links.dart/links.dart';
import 'package:api_implementation/Model%20Classes/Engadget/Content.dart';
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
          backgroundColor: Colors.blue,
          title: const Text(
            "Articles by Wall Street Journal",
            style: TextStyle(fontSize: 18),
          )),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: news == null
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : SingleChildScrollView(
                child: Column(
                  children: [
                    ...news!.articles!.map(
                      (article) => ListTile(
                        title: Text(article.title ?? ""),
                        subtitle: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            const SizedBox(height: 10),
                            Text(article.author ?? ""),
                            const SizedBox(height: 10),
                            Text(article.description ?? ""),
                            const SizedBox(height: 15),
                            article.urlToImage != null
                                ? Image.network(
                                    article.urlToImage!,
                                    width: 400,
                                    height: 200,
                                    fit: BoxFit.cover,
                                  )
                                : Container(),
                            const SizedBox(height: 10),
                            const Divider(
                              thickness: 3.0,
                              color: Colors.yellowAccent,
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
      ),
    );
  }
}
