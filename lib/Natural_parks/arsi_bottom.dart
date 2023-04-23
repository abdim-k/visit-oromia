import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:number_paginator/number_paginator.dart';
import 'package:visit_oromia/Natural_parks/bale_screen.dart';

class ArsiBottomBar extends StatefulWidget {
  const ArsiBottomBar({super.key});

  @override
  State<ArsiBottomBar> createState() => _ArsiBottomBarState();
}

class _ArsiBottomBarState extends State<ArsiBottomBar> {
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
                      "Arsi National Parks",
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 20),
                      textAlign: TextAlign.justify,
                    ),
                    Text(
                      "The dry evergreen forests are interspersed with areas of mixed plantations of native and exotic trees between 3181 and 3340 meters elevation.",
                      style: TextStyle(color: Colors.black87, fontSize: 19),
                      textAlign: TextAlign.justify,
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Text(
                      "BATU TOURISM, TRADE AND INVESTMENT BAZAR",
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 20),
                      textAlign: TextAlign.justify,
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Text(
                      "INTRODUCTION Tourism industry has been one of the macroeconomic sector through which socio economic situation of many countries have been changed. Our country has paid special attention to this sector to solve the problems of unemployment, economic as well as social issues. The Oromia tourism commission has been working with the stakeholders to change the situation of tourism of the region. Based on this the commission is planning to launch “Batu tourism, trade and Investment bazar” at Batu town together with Batu town administration. Therefore, this term of reference is prepared to show key notes about the bazar. ABOUT BATU TOWN Batu town is one of the towns of Oromia which is located in the most stunning tourist attracting areas. The town is established on Dembela Lake on which many resorts and lodges built to give accommodation services. Beside this, the town is located on the major tourism rout that takes to Bale, Borena, Awasa, Shashemene, Konso and South region as a whole. This rift valley centered town can be the pleasure of tourists and can be the source of tourism economy generator ABOUT THE BAZAR Bazars are ways of bringing industry related components in one point for the objectives intended to be achieved. The Batu bazar is thought to bring tourism industry related components at one spot to achieve the objectives that are mentioned in this note. This multi activity bazar will be carried on at Batu town for seven consecutive days starting from 02/05/2014 to 10/05/2014 tentative time OBJECTIVES OF THE BAZAR - Attracting more tourists to Batu town and its surrounding attractions and to the region - Attracting more tourism investment to the town, to its surrounding and to the region - To engage diaspora home comers in tourism, trade and investment of the area TARGET AUDIENCE Direct audience that is expected to attend the bazar is estimated to be 20,000. Through Medias millions of audience is expected to be reached. - Reaching audience through traditional and social media in a way that achieves the overall objectives of the bazar - Inviting large number of audience to the bazar from the surrounding towns and villages, Finfinnee and other areas - Inviting large number of diaspora to enjoy the bazar",
                      style: TextStyle(color: Colors.black87, fontSize: 19),
                      textAlign: TextAlign.justify,
                    ),
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
                          "You have done, thank you for your time ",
                          style: TextStyle(
                              fontSize: 20,
                              color: Colors.redAccent,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 10,
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
