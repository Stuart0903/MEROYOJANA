import 'package:flutter/material.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:page_transition/page_transition.dart';

import '../../utils/constants/colors.dart';


class SplashScreen extends StatelessWidget {
  final Widget nextScreen;

  const SplashScreen({super.key, required this.nextScreen});

  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      splash: Image.asset(
        'assets/animations/UN.gif',
        fit: BoxFit.cover,
      ),
      nextScreen: nextScreen,
      splashIconSize: double.infinity,
      duration: 5000, // Duration in milliseconds (3 seconds)
      splashTransition: SplashTransition.fadeTransition,
      pageTransitionType: PageTransitionType.fade,
      backgroundColor: Colors.white,
    );
  }
}