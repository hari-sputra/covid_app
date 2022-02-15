import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../theme.dart';

class CarouselWidget extends StatelessWidget {
  final String text, img;
  final Color container;
  const CarouselWidget({
    Key? key,
    required this.text,
    required this.img,
    required this.container,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        top: 30,
      ),
      width: double.infinity,
      padding: EdgeInsets.only(
        top: 20,
        bottom: 20,
        left: 10,
        right: 10,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        color: container,
      ),
      child: Row(
        children: [
          Lottie.asset(
            img,
            height: 100,
            width: 100,
            fit: BoxFit.fill,
          ),
          SizedBox(width: 17),
          Expanded(
            child: Text(
              text,
              style: primaryTextStyle.copyWith(
                fontSize: 16,
                fontWeight: semiBold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
