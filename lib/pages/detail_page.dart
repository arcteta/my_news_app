import 'package:flutter/material.dart';
import 'package:my_news_app/controller/news_provider.dart';
import 'package:my_news_app/models/news_model.dart';
import 'package:provider/provider.dart';

class DetailNewsUI extends StatelessWidget {
  const DetailNewsUI({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("ini app bar nya detail"),
      ),
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Consumer<NewsProvider>(
          builder: (_, cp, __) {
            return Column(
              children: [Image.network(cp.selectedNews?.urlToImage ?? '-')],
            );
          },
        ),
      ),
    );
  }
}
