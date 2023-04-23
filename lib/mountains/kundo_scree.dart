import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:visit_oromia/cave/sofomar_bottom.dart';

import '../widgets/post_app_bar.dart';
import '../widgets/post_bottom_bar.dart';
import 'chuk_bottom.dart';
import 'kundo_bottom.dart';

class KundoScreen extends StatelessWidget {
  const KundoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage("img/kundudo.jpg"),
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
        bottomNavigationBar: KundoBottomBar(),
      ),
    );
  }
}
