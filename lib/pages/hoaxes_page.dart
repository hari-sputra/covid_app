import 'package:covid_app/models/hoaxes_model.dart';
import 'package:covid_app/services/hoaxes.dart';
import 'package:covid_app/theme.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../models/news_model.dart';

class HoaxesPage extends StatefulWidget {
  const HoaxesPage({Key? key}) : super(key: key);

  @override
  State<HoaxesPage> createState() => _HoaxesPageState();
}

class _HoaxesPageState extends State<HoaxesPage> {
  late Future<List<Hoaxes>> hoaxesData;

  @override
  void initState() {
    hoaxesData = getDataHoaxes();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // Note: Header
    Widget headerText() {
      return Container(
        margin: EdgeInsets.only(top: 10),
        child: Text(
          "Berita Hoax \nCovid-19",
          style: primaryTextStyle.copyWith(
            fontSize: 24,
            fontWeight: semiBold,
          ),
        ),
      );
    }

    // Note: content
    Widget mainContent() {
      return FutureBuilder<List<Hoaxes>>(
          future: hoaxesData,
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
