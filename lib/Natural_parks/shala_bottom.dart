import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:number_paginator/number_paginator.dart';
import 'package:visit_oromia/Natural_parks/walal_screen.dart';

class ShalaBottomBar extends StatefulWidget {
  const ShalaBottomBar({super.key});

  @override
  State<ShalaBottomBar> createState() => _ShalaBottomBarState();
}

class _ShalaBottomBarState extends State<ShalaBottomBar> {
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
                      "Abijata Shalla National Park.",
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 20),
                      textAlign: TextAlign.justify,
                    ),
                    Text(
                      "Known by its bird species, Abijatta-Shalla Lakes National Park was primarily created for its spectacular numbers of aquatic birds, especially Great white Pelican and Lesser Flamingo, the bird breeding islands in Lake Shalla, and its scenery. It is a famous and significant ornithological site in the country. It is endowed with 76 mammal and 436 bird species. Abijatta-Shalla Lakes National Park is found 207 km South of Addis (Finfinne), situated in the main Rift within an altitude range of 1540-2075m asl, the highest peak being Mount Fike, which is situated between the two lakes.  Among bird species, Yellow-fronted Parrot is endemic to the park while Grant’s gazelle, Colobus monkey, grivet monkey From flamingo filled shorelines to hippos chortling in the orange glow of incredible sunsets, the lakes of the rift valley in the central Oromia region and beyond are a paradise enjoyed by many. Whether wanting to frolic in the caramel-coloured waters of Langano or venture along the wilder shores of Shalla in search of birds of paradise, the many lake environments offer something for all pleasure seekers. Taking a boat out in the evening light to watch the sun dip with spectacular glory below the fire-coloured horizon is no better way to ease the mind and enjoy the pleasures of our natural world.",
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
                              builder: (context) => const WalalScreen(),
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
