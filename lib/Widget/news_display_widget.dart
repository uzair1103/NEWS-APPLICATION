import 'package:api_implementation/Model%20Classes/Engadget/Content.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../Data Provider From Server/data_provider.dart';

class NewsDisplayWidget extends StatelessWidget {
  final AutoGenerated? newss;
  const NewsDisplayWidget({required this.newss, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: newss == null
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : SingleChildScrollView(
                child: Column(
                  children: [
                    ...newss!.articles!.map(
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
