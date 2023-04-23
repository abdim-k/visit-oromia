import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:number_paginator/number_paginator.dart';
import 'package:visit_oromia/Natural_parks/shala_screen.dart';
import 'package:visit_oromia/cave/wabe_screen.dart';

import '../museams/malka_screen.dart';
import 'kundo_scree.dart';

class ChukBottomBar extends StatefulWidget {
  const ChukBottomBar({super.key});

  @override
  State<ChukBottomBar> createState() => _ChukBottomBarState();
}

class _ChukBottomBarState extends State<ChukBottomBar> {
  int numberOfPages = 2;
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
                      "Mountains",
                      style: TextStyle(
                          fontSize: 20,
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
                      "Mount Chuqqaala",
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 23),
                      textAlign: TextAlign.justify,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "Mount Chuqqaala is an extinct volcano in the Oromia region. Being situated in Ada'a Chukala woreda of the East Shewa Zone, it rises from the plain 30 kilo Metres (19 mi) south of Bishoftu. With a height of 2,989 metres (9,806 ft), it is known for its crater lake, lake Dembel, an elliptical crater lake with a maximum diameter of about one kilometer, but the trail around the crater is about 6 kilometers long. Both the mountain and the lake is a holy site to the Oromo living nearby. The lake in the crater has an island Tulluu Irreechaa, said to have been founded by Abba Gadaa of Tuulama on the site of a hermitage used by Saint Mercurius. This monastery was destroyed, and a church at the foot of the mountain looted, by Imam Ahmad Gragn in 1531; two churches were later built at the monastery, one dedicated to St Gebre Menfas built by Menelik II in 1880 and designed by the Italian Sebastian Castagna, and the other dedicated to Kidane Mihret built during the reign of Haile Selassie.",
                      style: TextStyle(color: Colors.black87, fontSize: 19),
                      textAlign: TextAlign.justify,
                    )
                  ],
                ),
                SizedBox(
                  height: 10,
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
                              builder: (context) => const KundoScreen(),
                            ),
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
