import 'package:covid_app/theme.dart';
import 'package:flutter/material.dart';

class StartedPage extends StatelessWidget {
  const StartedPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: darkBlueColor,
      body: SafeArea(
        top: false,
        child: Stack(
          children: [
            Container(
              height: 599,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/images/intro.png"),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                height: 340,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(35),
                  ),
                  color: whiteColor,
                ),
                child: Container(
                  padding: EdgeInsets.symmetric(
                    vertical: 35,
                    horizontal: 35,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Be aware \nStay healthy",
                        style: primaryTextStyle.copyWith(
                          fontSize: 38,
                        ),
                      ),
                      SizedBox(height: 25),
                      Text(
                        "Welcome to COVID-19 information portal.",
                        style: subtitleTextStyle.copyWith(
                          fontSize: 16,
                        ),
                      ),
                      const Spacer(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(
                            "GET STARTED",
                            style: subtitleTextStyle.copyWith(
                              fontSize: 15,
                              fontWeight: semiBold,
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.pushReplacementNamed(
                                context,
                                '/main',
                              );
                            },
                            child: Container(
                              margin: EdgeInsets.only(left: 20),
                              width: 50,
                              height: 50,
                              decoration: BoxDecoration(
                                color: purpleColor,
                                shape: BoxShape.circle,
                              ),
                              child: Icon(
                                Icons.arrow_forward,
                                color: whiteColor,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
