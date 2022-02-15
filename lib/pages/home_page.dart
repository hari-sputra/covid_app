import 'dart:convert';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:covid_app/models/status.dart';
import 'package:covid_app/theme.dart';
import 'package:covid_app/widgets/carousel.dart';
import 'package:covid_app/widgets/main_content.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'package:lottie/lottie.dart';

import '../services/api.dart';
import '../services/status.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  late Future<StatusCovid> statusCovid;
  late Future<Region> regionData;
  TabController? tabBarController;

  String? nameProv;

  static const List<Tab> myTab = [
    Tab(
      text: "Country",
    ),
    Tab(
      text: "Region",
    ),
  ];

  @override
  void initState() {
    super.initState();
    tabBarController = TabController(length: myTab.length, vsync: this);
    statusCovid = getDataCovid();
    regionData = getDataRegion();
  }

  @override
  void dispose() {
    super.dispose();
    tabBarController!.dispose();
  }

  final List<Widget> carouselList = [
    CarouselWidget(
      text: "Menjaga jarak ketika anda berada dikeramaian",
      img: "assets/lottie/distance.json",
      container: lightBlueColor,
    ),
    CarouselWidget(
      text: "Memakai masker ketika anda berpergian",
      img: "assets/lottie/mask.json",
      container: lightGreenColor,
    ),
    CarouselWidget(
      text: "Mencuci tangan anda hingga bersih setelah anda berpergian",
      img: "assets/lottie/hand.json",
      container: orangeColor,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    // Note: Header Content
    Widget headerContent() => Container(
          margin: EdgeInsets.only(top: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const CircleAvatar(
                radius: 25,
                backgroundColor: whiteColor,
                backgroundImage: AssetImage(
                  "assets/icons/account.png",
                ),
              ),
              Container(
                padding: EdgeInsets.all(4),
                decoration: BoxDecoration(
                  color: lightPurpleColor.withOpacity(.2),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Row(
                  children: [
                    Container(
                      margin: EdgeInsets.only(right: 7),
                      width: 32,
                      height: 32,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                          image: AssetImage(
                            "assets/images/flag.png",
                          ),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Icon(Icons.arrow_drop_down),
                  ],
                ),
              ),
            ],
          ),
        );

    // Note: carousel
    Widget carousel() => CarouselSlider(
          items: carouselList,
          options: CarouselOptions(
            enlargeCenterPage: true,
            autoPlay: true,
          ),
        );

    // Note: Tab bar
    Widget tabBarContent() => Container(
          margin: EdgeInsets.only(top: 30),
          padding: EdgeInsets.all(6),
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(100),
            color: orangeColor.withOpacity(.4),
          ),
          child: Row(
            children: [
              GestureDetector(
                onTap: () {},
                child: Container(
                  width: 172,
                  height: 38,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                    color: whiteColor,
                  ),
                  child: Center(
                    child: Text(
                      "Tracker",
                      style: primaryTextStyle.copyWith(
                        fontSize: 16,
                        fontWeight: semiBold,
                      ),
                    ),
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {},
                child: Container(
                  width: 172,
                  height: 38,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                    color: Colors.transparent,
                  ),
                  child: Center(
                    child: Text(
                      "Symptoms",
                      style: brownTextStyle.copyWith(
                        fontSize: 16,
                        fontWeight: semiBold,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        );

    // Note: main content
    Widget mainContent() => FutureBuilder<StatusCovid>(
          future: statusCovid,
          builder: (context, AsyncSnapshot<StatusCovid> snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Container(
                margin: EdgeInsets.only(top: 30),
                child: Column(
                  children: [
                    TabBar(
                      controller: tabBarController,
                      tabs: myTab,
                      indicatorColor: Colors.transparent,
                      labelColor: darkBlueColor,
                      labelStyle: primaryTextStyle.copyWith(
                        fontSize: 16,
                        fontWeight: semiBold,
                      ),
                      unselectedLabelColor: greyColor,
                      unselectedLabelStyle: subtitleTextStyle.copyWith(
                        fontSize: 14,
                        fontWeight: semiBold,
                      ),
                    ),
                    Lottie.asset(
                      "assets/lottie/loading.json",
                    ),
                  ],
                ),
              );
            }
            return Container(
              margin: EdgeInsets.only(top: 30),
              child: Column(
                children: [
                  TabBar(
                    controller: tabBarController,
                    tabs: myTab,
                    indicatorColor: Colors.transparent,
                    labelColor: darkBlueColor,
                    labelStyle: primaryTextStyle.copyWith(
                      fontSize: 16,
                      fontWeight: semiBold,
                    ),
                    unselectedLabelColor: greyColor,
                    unselectedLabelStyle: subtitleTextStyle.copyWith(
                      fontSize: 14,
                      fontWeight: semiBold,
                    ),
                  ),
                  SizedBox(
                    height: 300,
                    child: TabBarView(
                      controller: tabBarController,
                      children: [
                        MainContent(
                          infected: NumberFormat.currency(
                            locale: 'id',
                            symbol: '',
                            decimalDigits: 0,
                          ).format(snapshot.data!.numbers.infected),
                          recovered: NumberFormat.currency(
                            locale: 'id',
                            symbol: '',
                            decimalDigits: 0,
                          ).format(snapshot.data!.numbers.recovered),
                          fatal: NumberFormat.currency(
                            locale: 'id',
                            symbol: '',
                            decimalDigits: 0,
                          ).format(snapshot.data!.numbers.fatal),
                        ),
                        ListView(
                          children: [
                            DropdownSearch<Region>(
                              mode: Mode.DIALOG,
                              showSearchBox: true,
                              onChanged: (value) => nameProv = value?.name,
                              dropdownBuilder: (context, selectedItem) =>
                                  Text(selectedItem?.name ?? "Pilih Provinsi"),
                              popupItemBuilder: (context, item, isSelected) =>
                                  ListTile(
                                title: Text(item.name),
                              ),
                              onFind: (text) async {
                                final response = await http.get(
                                  Uri.parse(statusApi),
                                );
                                if (response.statusCode != 200) {
                                  return [];
                                }
                                List allRegion = (json.decode(response.body)
                                    as Map<String, dynamic>)["regions"];
                                List<Region> allModelRegion = [];

                                allRegion.forEach((element) {
                                  allModelRegion.add(
                                    Region(
                                      name: element['name'],
                                    ),
                                  );
                                });
                                return allModelRegion;
                              },
                            ),
                            FutureBuilder<Region>(
                                future: regionData,
                                builder: (context, snp) {
                                  if (snp.connectionState ==
                                      ConnectionState.waiting) {
                                    return Center(
                                      child: Lottie.asset(
                                          "assets/lottie/loading.json"),
                                    );
                                  }
                                  return Container(
                                    margin: EdgeInsets.only(top: 10),
                                    child: MainContent(
                                      infected: NumberFormat.currency(
                                        locale: 'id',
                                        symbol: '',
                                        decimalDigits: 0,
                                      ).format(nameProv != null
                                          ? snp.data!.numbers!.infected
                                          : 0),
                                      recovered: NumberFormat.currency(
                                        locale: 'id',
                                        symbol: '',
                                        decimalDigits: 0,
                                      ).format(nameProv != null
                                          ? snp.data!.numbers!.recovered
                                          : 0),
                                      fatal: NumberFormat.currency(
                                        locale: 'id',
                                        symbol: '',
                                        decimalDigits: 0,
                                      ).format(nameProv != null
                                          ? snp.data!.numbers!.fatal
                                          : 0),
                                    ),
                                  );
                                }),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          },
        );

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(18),
          child: ListView(
            physics: BouncingScrollPhysics(),
            children: [
              headerContent(),
              carousel(),
              tabBarContent(),
              mainContent(),
            ],
          ),
        ),
      ),
    );
  }
}
