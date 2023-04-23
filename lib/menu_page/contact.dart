import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:visit_oromia/screens/home_screen.dart';

class AboutMe extends StatelessWidget {
  const AboutMe({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'About',
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () => Navigator.of(context).pushReplacement(
              MaterialPageRoute(
                builder: (context) => const HomePage(),
              ),
            ),
          ),
          title: const Center(child: Text('About')),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Container(
                margin: const EdgeInsets.only(top: 20.0),
                child: const Text(
                  'Abdi Musa',
                  style: TextStyle(
                    fontSize: 30.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.symmetric(
                    horizontal: 20.0, vertical: 10.0),
                child: const Text(
                  "Hello there! I'm Abdi Musa, and I'm excited to introduce myself as the developer of Visit Oromia, app that helps people explore the beautiful region of Oromia.\nWhether you're a first-time visitor to Oromia or a seasoned traveler looking for something new, Visit Oromia has everything you need to plan the perfect trip. From scenic hikes and cultural landmarks to delicious local cuisine and comfortable lodgings, our app has it all.\n If you're interested in developing a similar app or have any questions about web app development, feel free to contact me through my social links below. I'm always happy to share my knowledge and help others bring their ideas to life.\n \nWebsite: pioneerwebdevelopers.com",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 20.0,
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    IconButton(
                      icon: const FaIcon(FontAwesomeIcons.instagram),
                      onPressed: () => launch(
                          'https://instagram.com/abdim_k?igshid=ZDdkNTZiNTM='),
                    ),
                    IconButton(
                      icon: const FaIcon(FontAwesomeIcons.linkedin),
                      onPressed: () => launch(
                          'https://www.linkedin.com/in/abdi-musa-6a32b0245/'),
                    ),
                    IconButton(
                      icon: const FaIcon(FontAwesomeIcons.github),
                      onPressed: () => launch('https://github.com/abdim-k'),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
