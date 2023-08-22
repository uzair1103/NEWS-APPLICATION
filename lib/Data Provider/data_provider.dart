import 'package:api_implementation/Model%20Classes/Engadget/Content.dart';
import 'package:dio/dio.dart';

class DataProvider {
  static final _news = Dio();
  static Future<Autogenerated> getNews(String newsLink) async {
    try {
      final rawData = await _news.get(newsLink);
      print(rawData);
      final Autogenerated dataa =
          Autogenerated.fromJson(rawData.data as Map<String, dynamic>);
      return dataa;
    } catch (e) {
      rethrow;
    }
  }
}