import 'package:covid_app/theme.dart';
import 'package:flutter/material.dart';

class MainContent extends StatelessWidget {
  final String infected, recovered, fatal;
  const MainContent({
    Key? key,
    required this.infected,
    required this.recovered,
    required this.fatal,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              padding: EdgeInsets.symmetric(
                vertical: 13,
                horizontal: 15,
              ),
              width: 150,
              height: 131,
              decoration: BoxDecoration(
                color: redColor.withOpacity(.1),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                children: [
                  Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      "Infected",
                      style: redTextStyle.copyWith(
                        fontSize: 18,
                        fontWeight: medium,
                      ),
                    ),
                  ),
                  Spacer(),
                  Align(
                    alignment: Alignment.bottomRight,
                    child: Text(
                      infected,
                      style: redTextStyle.copyWith(
                        fontSize: 25,
                        fontWeight: semiBold,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(
                vertical: 13,
                horizontal: 15,
              ),
              width: 180,
              height: 131,
              decoration: BoxDecoration(
                color: greenColor.withOpacity(.1),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                children: [
                  Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      "Recovered",
                      style: greenTextStyle.copyWith(
                        fontSize: 18,
                        fontWeight: medium,
                      ),
                    ),
                  ),
                  Spacer(),
                  Align(
                    alignment: Alignment.bottomRight,
                    child: Text(
                      recovered,
                      style: greenTextStyle.copyWith(
                        fontSize: 25,
                        fontWeight: semiBold,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        SizedBox(height: 20),
        Container(
          padding: EdgeInsets.symmetric(
            vertical: 13,
            horizontal: 15,
          ),
          width: 200,
          height: 131,
          decoration: BoxDecoration(
            color: greyColor.withOpacity(.1),
            borderRadius: BorderRadius.circular(20),
          ),
          child: Column(
            children: [
              Align(
                alignment: Alignment.topLeft,
                child: Text(
                  "Fatal",
                  style: greyTextStyle.copyWith(
                    fontSize: 18,
                    fontWeight: medium,
                  ),
                ),
              ),
              Spacer(),
              Align(
                alignment: Alignment.bottomRight,
                child: Text(
                  fatal,
                  style: greyTextStyle.copyWith(
                    fontSize: 25,
                    fontWeight: semiBold,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
