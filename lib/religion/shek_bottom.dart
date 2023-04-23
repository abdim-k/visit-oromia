import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:number_paginator/number_paginator.dart';
import 'package:visit_oromia/Natural_parks/shala_screen.dart';
import 'package:visit_oromia/cave/wabe_screen.dart';

import '../mountains/kundo_scree.dart';
import '../museams/malka_screen.dart';
import 'debre_screen.dart';

class ShekBottomBar extends StatefulWidget {
  const ShekBottomBar({super.key});

  @override
  State<ShekBottomBar> createState() => _ShekBottomBarState();
}

class _ShekBottomBarState extends State<ShekBottomBar> {
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
                      "Religious Pilgrimage",
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
                      "Dirre Sheikh Hussein Shrine",
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
                      "Back on the main road from Goba, continue heading east, where the road takes a sharp bend as it crosses the Web River and begins to head north through the towns of Ginir and Jara before coming to Shek Husen, seventy-eight Kilometres (48 miles) north of Ginir. The site, Ethiopia's most important place of Muslim pilgrimage, is situated on the borders of Arsi and Bale regions and quite close to the border of Harerge. Sheikh Hussein is visited twice a year by many thousands of pilgrims from all over eastern Ethiopia, and comprises a large complex of mosques, shrines, and tombs surrounded by a stout wall. There are also a number of man-made caves and artificial ponds in the area. Holy white chalk from the caves is taken back by the pilgrims to many parts of the country.",
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
                              builder: (context) => const DebreScreen(),
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
