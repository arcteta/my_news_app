import 'package:flutter/material.dart';
import 'package:my_news_app/controller/news_provider.dart';
import 'package:my_news_app/pages/detail_page.dart';
import 'package:my_news_app/pages/main_page.dart';
import 'package:provider/provider.dart';
// import 'package:my_news_app/pages/main_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => NewsProvider(),
        )
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const ListBeritaUI(),
      ),
    );
  }
}
