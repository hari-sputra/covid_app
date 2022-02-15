import 'package:covid_app/services/news.dart';
import 'package:covid_app/theme.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../models/news_model.dart';

class NewsPage extends StatefulWidget {
  const NewsPage({Key? key}) : super(key: key);

  @override
  State<NewsPage> createState() => _NewsPageState();
}

class _NewsPageState extends State<NewsPage> {
  late Future<List<News>> newsData;

  @override
  void initState() {
    newsData = getDataNews();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // Note: Header
    Widget headerText() {
      return Container(
        margin: EdgeInsets.only(top: 10),
        child: Text(
          "Berita Terbaru \nCovid-19",
          style: primaryTextStyle.copyWith(
            fontSize: 24,
            fontWeight: semiBold,
          ),
        ),
      );
    }

    // Note: content
    Widget mainContent() {
      return FutureBuilder<List<News>>(
          future: newsData,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                child: Lottie.asset("assets/lottie/loading.json"),
              );
            }
            return SizedBox(
              height: MediaQuery.of(context).size.height * 1,
              child: ListView.builder(
                itemCount: snapshot.data!.length,
                itemBuilder: (context, index) {
                  return Container(
                    margin: EdgeInsets.only(top: 20),
                    child: Card(
                      child: Container(
                        margin: EdgeInsets.all(10),
                        child: Text(
                          snapshot.data![index].title,
                          style: primaryTextStyle.copyWith(
                            fontSize: 16,
                            fontWeight: medium,
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            );
          });
    }

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: ListView(
            children: [
              headerText(),
              mainContent(),
            ],
          ),
        ),
      ),
    );
  }
}
