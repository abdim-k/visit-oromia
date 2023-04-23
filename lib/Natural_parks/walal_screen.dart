import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:visit_oromia/Natural_parks/shala_bottom.dart';
import 'package:visit_oromia/Natural_parks/walal_bottom.dart';

import '../widgets/post_app_bar.dart';
import '../widgets/post_bottom_bar.dart';
import 'Awash_bottom.dart';

class WalalScreen extends StatelessWidget {
  const WalalScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage("img/walal.jpg"),
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
        bottomNavigationBar: WalalBottomBar(),
      ),
    );
  }
}
