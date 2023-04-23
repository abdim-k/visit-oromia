import 'package:flutter/material.dart';

import 'package:share_plus/share_plus.dart';
import 'package:visit_oromia/menu_page/contact.dart';

class HomeAppBar extends StatelessWidget {
  const HomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          InkWell(
            onTap: () => Navigator.of(context).pushReplacement(
              MaterialPageRoute(
                builder: (context) => const AboutMe(),
              ),
            ),
            child: const Icon(
              Icons.info_outline_rounded,
              size: 28,
            ),
          ),
          Row(
            children: const [
              Icon(
                Icons.location_on,
                color: Color(0xFFF65959),
              ),
              Text(
                "Ethiopia, Oromia",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
          InkWell(
            onTap: () {
              Share.share(
                  "https://play.google.com/store/apps/details?id=com.pioneerapps.visitoromia");
            },
            child: const Icon(
              Icons.share_outlined,
              size: 28,
            ),
          ),
        ],
      ),
    );
  }
}
