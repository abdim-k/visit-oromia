import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../widgets/post_app_bar.dart';
import '../widgets/post_bottom_bar.dart';
import 'jifar_bottom.dart';
import 'malka_bottom.dart';
import 'oromo_bottom.dart';

class OromoScreen extends StatelessWidget {
  const OromoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage("img/oromo.jpg"),
          fit: BoxFit.cover,
          opacity: 0.7,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(90),
          child: PostAppBar(),
        ),
        bottomNavigationBar: OromoBottomBar(),
      ),
    );
  }
}
