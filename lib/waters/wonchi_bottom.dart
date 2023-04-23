import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:number_paginator/number_paginator.dart';
import 'package:visit_oromia/Natural_parks/shala_screen.dart';
import 'package:visit_oromia/cave/laga_screen.dart';

import '../museams/malka_screen.dart';

class WonchiBottomBar extends StatefulWidget {
  const WonchiBottomBar({super.key});

  @override
  State<WonchiBottomBar> createState() => _WonchiBottomBarState();
}

class _WonchiBottomBarState extends State<WonchiBottomBar> {
  int numberOfPages = 3;
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
                      "Water Bodies",
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
                      "Wenchi Crater Lake",
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 23),
                      textAlign: TextAlign.justify,
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      "Wenchi Crater Lake is the picturesque lake situated about 32kilometres south west of Ambo on the road to Waliso nearly half way between the two towns. Coming from Ambo or from Waliso to Wanchi Crater Lake the gravel road ascends mountain slopes almost to the rim of the crater where the height reaches 3386m at a peak. Here green oasis, (when compared to surrounding area) comes to view. Touristic appeal of the crater mainly steamed from its fantastic beauty. Standing on the rim of the crater you will be watching unique shaped and crystal clear water lying in deep basin and circular slops covered with greenery alpine vegetation that largely contributed for its dramatic scenery. In addition to these, when you see the village on peninsula, the small island with monastery, the houses and gardens on the lake side it seems that crater not to be touched by modern world. The Crater Lake is endowed with forest of more than 15 major tree species and many other alpine type vegetation, many aquatic and terrestrial bird species and some mammals, of which calobus monkey frequently seen. In the hot spring valley, one can observe natural offers like hot and cold mineral springs (being used by local people for cure of illness): the waterfall gushing out just from the foot of the hill and many other eye-catching scene. Wanchi Crater Lake is an ideal site, and has a good appeal to such tourist activities and recreations like hiking, boating/canoeing, horseback riding, sailing, paragliding, relaxing, forest exploring, spa bathing and many other eco-tourism oriented activities. Some of these activities are already made operational by Wonchi eco tourism society that composed of local community associations and private investor.",
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
