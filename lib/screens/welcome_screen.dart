import 'package:flutter/material.dart';

import 'home_screen.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage("img/welcome.png"),
          fit: BoxFit.cover,
          opacity: 0.7,
        ),
      ),
      child: Material(
        color: Colors.transparent,
        child: SafeArea(
            child: Padding(
          padding: EdgeInsets.symmetric(vertical: 65, horizontal: 25),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Enjoy",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 35,
                  letterSpacing: 1.5,
                ),
              ),
              SizedBox(
                height: 2,
              ),
              Text(
                "The World!",
                style: TextStyle(
                  color: Colors.white.withOpacity(0.9),
                  fontSize: 35,
                  fontWeight: FontWeight.w400,
                  letterSpacing: 1.5,
                ),
              ),
              SizedBox(
                height: 12,
              ),
              Text(
                "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.",
                style: TextStyle(
                  fontSize: 16,
                  letterSpacing: 1.2,
                ),
              ),
              SizedBox(height: 30),
              InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => HomePage(),
                    ),
                  );
                },
                child: Ink(
                  padding: EdgeInsets.all(15),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Icon(
                    Icons.arrow_forward_ios,
                    color: Colors.black54,
                    size: 20,
                  ),
                ),
              )
            ],
          ),
        )),
      ),
    );
  }
}
