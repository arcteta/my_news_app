import 'package:flutter/material.dart';
import 'package:my_news_app/models/news_model.dart';
import 'package:my_news_app/service/api.dart';

class NewsProvider extends ChangeNotifier {
  NewsModels? selectedNews;

  void selectNews(NewsModels data) {
    selectedNews = data;
    notifyListeners();
  }
}
