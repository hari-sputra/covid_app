import 'package:covid_app/pages/hoaxes_page.dart';
import 'package:covid_app/pages/home_page.dart';
import 'package:covid_app/pages/news_page.dart';
import 'package:covid_app/theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    // NOTE: Bottom Nav Bar
    Widget bottomNavBar() {
      return BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        elevation: 0,
        currentIndex: currentIndex,
        onTap: (value) {
          setState(() {
            currentIndex = value;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(
              CupertinoIcons.home,
              color: currentIndex == 0 ? greenColor : greyColor,
            ),
            label: "",
          ),
          BottomNavigationBarItem(
            icon: Icon(
              CupertinoIcons.news,
              color: currentIndex == 1 ? greenColor : greyColor,
            ),
            label: "",
          ),
          BottomNavigationBarItem(
            icon: Icon(
              CupertinoIcons.news_solid,
              color: currentIndex == 2 ? greenColor : greyColor,
            ),
            label: "",
          ),
        ],
      );
    }

    // Note: body content
    Widget bodyContent() {
      switch (currentIndex) {
        case 0:
          return HomePage();
        case 1:
          return NewsPage();
        case 2:
          return HoaxesPage();

        default:
          return HomePage();
      }
    }

    return Scaffold(
      bottomNavigationBar: bottomNavBar(),
      body: bodyContent(),
    );
  }
}
