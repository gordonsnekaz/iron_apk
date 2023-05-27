// ignore_for_file: sized_box_for_whitespace

import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:ironapk/onboarding_screen.dart';

class Splash extends StatelessWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      splash: Column(
        children: [
          Container(
            height: 60,
            width: 60,
            child: const Image(image: AssetImage('assets/logo.png')),
          ),
          const SizedBox(
            height: 10,
          ),
          const Text(
            "House of Ironing",
            style: TextStyle(
                color: Color(0xff070C3A),
                fontSize: 18,
                fontWeight: FontWeight.bold),
          )
        ],
      ),
      backgroundColor: const Color(0xffffffff),
      nextScreen: const OnBoarding(),
      splashIconSize: 100,
      duration: 4000,
      splashTransition: SplashTransition.rotationTransition,
      animationDuration: const Duration(seconds: 1),
    );
  }
}
