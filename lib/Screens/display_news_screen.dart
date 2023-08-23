import 'package:api_implementation/Data%20Provider%20From%20Server/data_provider.dart';
import 'package:api_implementation/News%20names/news_names.dart';
import 'package:api_implementation/Screens/business_headlines_screen.dart';
import 'package:api_implementation/Screens/tech_crunch_headlines_screens.dart';
import 'package:api_implementation/Screens/tesla_news_screen.dart';
import 'package:api_implementation/Screens/wall_street_journal_screen.dart';
import 'package:api_implementation/Widgets/tab_selecting_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'apple_news_screen.dart';

class DisplayNewsScreen extends StatelessWidget {
  const DisplayNewsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final appState = NewsProvider.s(context);
    final app = Provider.of<NewsProvider>(context, listen: true);
    Widget selectedNewsScreen() {
      if (app.selectedTabIndex == 0) {
        return const AppleNewsScreen(); // Display AppleNewsScreen for index 1
      } else if (app.selectedTabIndex == 1) {
        return const BusinessHeadlinesScreen(); // Display WallStreetJournalScreen for other indexes
      } else if (app.selectedTabIndex == 2) {
        return const TechCrunchHeadlines();
      } else if (app.selectedTabIndex == 3) {
        return const TeslaNewsScreen();
      } else {
        return const WallStreetJournalScreen();
      }
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Latest News'),
        elevation: 0,
        backgroundColor: Colors.blue,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Wrap(
              alignment: WrapAlignment.center,
              spacing: 10,
              runSpacing: 10,
              children: [
                ...NewsNames.tabs.map((e) => TabSelect(
                      title: e,
                      isSelected: NewsNames.tabs.indexOf(e) ==
                          appState.selectedTabIndex,
                      index: NewsNames.tabs.indexOf(e),
                    )),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Expanded(child: selectedNewsScreen())
          ],
        ),
      ),
    );
  }
}
