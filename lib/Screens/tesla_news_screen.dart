import 'package:api_implementation/Data%20Provider%20From%20Server/data_provider.dart';
import 'package:api_implementation/Links.dart/links.dart';
import 'package:api_implementation/Model%20Classes/Engadget/Content.dart';
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
      appBar:
          AppBar(backgroundColor: Colors.blue, title: const Text("Tesla News")),
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
