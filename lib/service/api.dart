import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:my_news_app/models/news_model.dart';

class Api {
  Future<List<NewsModels>> readNewsData() async {
    // Pura2 get API
    final jsonData = await rootBundle.loadString('assets/data_news.json');
    final decoded = json.decode(jsonData) as List<dynamic>;
    
    return decoded.map((e) => NewsModels.fromJson(e)).toList();
  }
}
