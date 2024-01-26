import 'package:flutter/material.dart';
import 'package:my_news_app/controller/news_provider.dart';
import 'package:my_news_app/pages/detail_page.dart';
import 'package:provider/provider.dart';
// import 'package:my_news_app/service/api.dart';
import '../service/api.dart';

class ListBeritaUI extends StatelessWidget {
  const ListBeritaUI({super.key});

  @override
  Widget build(BuildContext context) {
    final newsProvider = Provider.of<NewsProvider>(context);
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(
                height: 25,
              ),
              // Todays News Widget
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    flex: 8,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Today News',
                          style: TextStyle(
                            fontSize: 28,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text('Wed, 08 January 2024')
                      ],
                    ),
                  ),
                  Stack(
                    alignment: Alignment.topRight,
                    children: [
                      CircleAvatar(
                        radius: 30,
                      ),
                      CircleAvatar(
                        radius: 10,
                        backgroundColor: Colors.red,
                      )
                    ],
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),

              // Latest News Widget
              FutureBuilder(
                  future: Api().readNewsData(),
                  builder: (context, snapshot) {
                    return Column(
                      children: [
                        const Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Latest News',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 220,
                          child: ListView.separated(
                            separatorBuilder: (_, __) => const SizedBox(
                              width: 12,
                            ),
                            itemCount: snapshot.data?.length ?? 0,
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (_, index) {
                              return GestureDetector(
                                onTap: () {
                                  newsProvider
                                      .selectNews(snapshot.data![index]);
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          const DetailNewsUI(),
                                    ),
                                  );
                                },
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Container(
                                      width: 250,
                                      height: 150,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(12),
                                        image: DecorationImage(
                                          fit: BoxFit.fill,
                                          image: NetworkImage(
                                            snapshot.data?[index].urlToImage ??
                                                '-',
                                          ),
                                        ),
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 5,
                                    ),
                                    Container(
                                      width: 200,
                                      child: Text(
                                        snapshot.data?[index].title ?? '_',
                                        style: const TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.black87,
                                            overflow: TextOverflow.ellipsis),
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 5,
                                    ),
                                    Container(
                                      width: 200,
                                      child: Text(
                                        snapshot.data?[index].description ??
                                            '0',
                                        style: const TextStyle(
                                          fontSize: 12,
                                          color: Colors.grey,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            },
                          ),
                        )
                      ],
                    );
                  }),
              const SizedBox(
                height: 20,
              ),
              // Hot News Widget
              Column(
                children: [
                  // Row Hot News
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Hot News',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        'View All',
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.black54,
                        ),
                      ),
                    ],
                  ),
                  FutureBuilder(
                      future: Api().readNewsData(),
                      builder: (context, snapshot) {
                        if (snapshot.connectionState == ConnectionState.done) {
                          return ListView.builder(
                            primary: true,
                            shrinkWrap: true,
                            itemCount: snapshot.data?.length,
                            physics: const NeverScrollableScrollPhysics(),
                            itemBuilder: (_, index) {
                              return ListTile(
                                title: Text(
                                  snapshot.data?[index].title ?? '-',
                                  style: const TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black87,
                                  ),
                                ),
                                subtitle: Text(
                                  snapshot.data?[index].description ?? '-',
                                  style: const TextStyle(
                                    overflow: TextOverflow.ellipsis,
                                    fontSize: 8,
                                    color: Colors.grey,
                                  ),
                                ),
                                leading: Container(
                                  width: 50,
                                  height: 50,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(12),
                                    image: DecorationImage(
                                      fit: BoxFit.fill,
                                      image: NetworkImage(
                                        snapshot.data?[index].urlToImage ?? '-',
                                      ),
                                    ),
                                  ),
                                ),
                              );
                            },
                          );
                          // return ListView.builder(
                          //     itemCount: snapshot.data?.length,
                          //     itemBuilder: (context, index) {
                          //       return ListTile(
                          //         leading: Image.network(
                          //             snapshot.data?[index].urlToImage! ?? '-'),
                          //       );
                          //     });
                        }
                        return CircularProgressIndicator();
                      })
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
