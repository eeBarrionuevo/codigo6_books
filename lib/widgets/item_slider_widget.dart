import 'dart:math';

import 'package:flutter/material.dart';

class ItemSliderWidget extends StatelessWidget {
  Map<int, Color> colors = {
    1: Color(0xffF8BACF),
    2: Color(0xffACDCF2),
    3: Color(0xffB2DFDC),
    4: Color(0xffE1BEE8),
    5: Color(0xffC5CAE8),
    6: Color(0xffFFCC80),
    7: Color(0xffffafcc),
    8: Color(0xffcdb4db),
    9: Color(0xffbde0fe),
    10: Color(0xff83c5be),
  };

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    double pyth = sqrt(pow(height, 2) + pow(width, 2));

    int index = Random().nextInt(10) + 1;

    return Container(
      width: pyth * 0.25,
      margin: EdgeInsets.only(right: 16.0, top: pyth * 0.042),
      child: Column(
        children: [
          Container(
            width: pyth * 0.25,
            height: pyth * 0.19,
            decoration: BoxDecoration(
              color: colors[index],
              borderRadius: BorderRadius.circular(12.0),
            ),
            child: Stack(
              clipBehavior: Clip.none,
              alignment: Alignment.center,
              children: [
                Positioned(
                  bottom: pyth * 0.028,
                  child: Container(
                    height: pyth * 0.195,
                    width: pyth * 0.14,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12.0),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.35),
                          blurRadius: 12,
                          offset: const Offset(4, 4),
                        ),
                      ],
                      image: const DecorationImage(
                        fit: BoxFit.cover,
                        image: NetworkImage(
                            "https://www.theonering.net/torwp/wp-content/uploads/2022/04/pu1i0ekgyhu81.webp"),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              children: [
                const Text(
                  "The lord of the rings: Chapter 2",
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.w600,
                    height: 1.0,
                  ),
                ),
                const SizedBox(
                  height: 6.0,
                ),
                Text(
                  "JRR Tolkien",
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: 14.0,
                    fontWeight: FontWeight.w500,
                    color: Colors.black.withOpacity(0.65),
                    height: 1.0,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
