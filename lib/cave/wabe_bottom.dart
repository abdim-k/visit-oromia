import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:number_paginator/number_paginator.dart';
import 'package:visit_oromia/Natural_parks/shala_screen.dart';
import 'package:visit_oromia/cave/laga_screen.dart';

import '../museams/malka_screen.dart';

class WabeBottomBar extends StatefulWidget {
  const WabeBottomBar({super.key});

  @override
  State<WabeBottomBar> createState() => _WabeBottomBarState();
}

class _WabeBottomBarState extends State<WabeBottomBar> {
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
                      "Cave and Rock Arts",
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
                      "Wabe Shebelle – caves, canyons and cultures",
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
                      "Wabe Shebelle is a region rather than a place and comprises the vast countryside that surrounds the river systems and gorges of the Wabe Shebelle River. A drive through this remote countryside is sure to excite a sense of exploration as you pass through some of the most spectacular gorges in the country. You are able to meet such hospitable people at ancient pilgrimage sites as well as walk deep into caves into which whole rivers disappear underground. Camping on the edge of incredibly steep cliff faces or along sandy riverbeds listening to lion call in the evening is a wonderful experience not to be missed in an off-track exploration of Ethiopia. Despite the amazing sites on offer on this back-country drive, this is not a route that many tourists travel down and you are welcomed by local villagers and farmers with friendly curiosity. An authentic experience in a beautiful country. A trip through the Wabe Shebelle region is generally a two to three day drive, connecting the Bale Mountains with the dry plains of the southern Danakil. The highlights of the drive are visits to the Wabe Shebelle gorges, Dire Sheik Hussein shrine and the Sof Omar caves. The landscape throughout is spectacular and there are chances to spot some unusual flora and fauna. As well as the highlights mentioned, there are opportunities to do some fantastic birding along this drive. Although not in any wildlife reserve, there are greater kudu, hamadreyas baboons and lions that wander up and down the river valleys here. Crocodiles are to be found in some of the pools along the rivers and black footed hyraxes scurry around on the cliffs. If starting the journey in the North, the land is parched and dry as the Danakil desert extends its southern reaches. As you travel along this back road though, you gradually gain altitude as you approach the Bale Mountains and the weather becomes a lot cooler. It can rain heavily between June and September but is wonderful to visit in October while the country is still green.",
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
