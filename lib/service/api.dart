import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:my_news_app/models/news_model.dart';

class Api {
  Future<List<News>> readNewsData() async {
    // Pura2 get API
    final jsonData = await rootBundle.loadString('assets/data_news.json');
    final decoded = json.decode(jsonData) as List<dynamic>;

    print(jsonData);
    print(decoded);
    return decoded.map((e) => News.fromJson(e)).toList();
  }
}
