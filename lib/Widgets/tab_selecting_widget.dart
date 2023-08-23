import 'package:flutter/material.dart';
import 'package:api_implementation/Model%20Classes/Engadget/Content.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../Data Provider From Server/data_provider.dart';

class TabSelect extends StatelessWidget {
  final bool isSelected;
  final String title;
  final int index;
  const TabSelect(
      {required this.index,
      this.isSelected = false,
      required this.title,
      super.key});
  @override
  Widget build(BuildContext context) {
    final app = Provider.of<NewsProvider>(context, listen: false);
    return GestureDetector(
      onTap: () {
        app.changeTab(index);
      },
      child: Container(
        height: 50,
        width: 110,
        decoration: BoxDecoration(
          color: isSelected
              ? Color.fromARGB(255, 186, 82, 8)
              : Color.fromARGB(255, 109, 105, 81),
          borderRadius: BorderRadius.circular(15),
          border: Border.all(color: Colors.black),
        ),
        child: Center(
          child: Text(
            title,
            style: const TextStyle(
                color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}
