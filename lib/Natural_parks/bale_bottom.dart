import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:number_paginator/number_paginator.dart';
import 'package:visit_oromia/Natural_parks/bale_screen.dart';

import 'arsi_screen.dart';

class BaleBottomBar extends StatefulWidget {
  const BaleBottomBar({super.key});

  @override
  State<BaleBottomBar> createState() => _BaleBottomBarState();
}

class _BaleBottomBarState extends State<BaleBottomBar> {
  int numberOfPages = 5;
  int currentPage = 0;
  @override
  Widget build(BuildContext context) {
    var pages = List.generate(
        numberOfPages,
        (index) => Center(
              child: Text(
                "Page Number:${index + 1}",
                style: const TextStyle(color: Colors.black, fontSize: 20),
              ),
            ));
    return Container(
      height: MediaQuery.of(context).size.height / 2,
      padding: EdgeInsets.only(top: 20, left: 20, right: 20),
      decoration: BoxDecoration(
        color: Color(0xFFEDF2F6),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(40),
          topRight: Radius.circular(40),
        ),
      ),
      child: ListView(
        children: [
          Padding(
            padding: EdgeInsets.only(),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "National Parks",
                      style: TextStyle(
                          fontSize: 23,
                          color: Colors.redAccent,
                          fontWeight: FontWeight.w600),
                    ),
                    // SizedBox(height: 10,)
                    Row(
                      children: [
                        Icon(
                          Icons.star,
                          color: Colors.amber,
                          size: 25,
                        ),
                        Text(
                          "4.5",
                          style: TextStyle(fontWeight: FontWeight.w600),
                        )
                      ],
                    )
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Column(
                  children: [
                    Text(
                      "Bale Mountains National Park: One park Many Worlds",
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 20),
                      textAlign: TextAlign.justify,
                    ),
                    Text(
                      "stablished in 1970, Bale Mountains National park (BMNP) covers the largest area higher than 3000m above sea level (asl) in Africa. The highest peak in the BMNP, Tullu Dimtuu, at an altitude of 4377m asl, is the second highest peak in Ethiopia. The park includes an Afroalpine plateau over 3500m asl, which is the largest area of Afroalpine habitat on the African continent, as well as a major section of moist tropical forest, the second largest in Ethiopia. The park is known by its diversified wildlife resources and affluent endemic birds and mammals. It is 400 km from Addis Ababa with an Area of 2,200 km2. Moreover, it is a home of Mountain Nyala, Menelik’s Bushbuck, Ethiopian Wolf, Lion, Leopard, Bohor Reedbuck, Bale Monkey and , Abyssinian Hare. BMNP is also endowed with vast amount of bird species including Blue-winged Goose, Abyssinian cat bird, White Cheeked turaco, Spot-breasted lapwing, Abyssinian long claw, Ethiopian/black-headed siskin, Roget’s rail, Golden Eagle, Lammergeyer, Abyssinian Wood Pecker",
                      style: TextStyle(color: Colors.black87, fontSize: 19),
                      textAlign: TextAlign.justify,
                    )
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Container(
                        child: Text(
                          "Next ",
                          style: TextStyle(
                              fontSize: 25,
                              color: Colors.redAccent,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const ArsiScreen()),
                          );
                        },
                        child: Container(
                          alignment: Alignment.center,
                          padding: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(15),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black26,
                                blurRadius: 6,
                              )
                            ],
                          ),
                          child: Icon(
                            Icons.arrow_forward_ios,
                            size: 28,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  child: pages[currentPage],
                ),
                NumberPaginator(
                  numberPages: numberOfPages,
                  onPageChange: (index) {
                    setState(() {
                      currentPage = index;
                    });
                  },
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
