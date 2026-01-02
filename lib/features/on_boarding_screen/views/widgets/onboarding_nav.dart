
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../../utils/constants/colors.dart';
import '../../../../utils/helpers/helpers.dart';
import '../../controllers/onboarding_controller.dart';

class OnBoardingNav extends StatelessWidget {
  const OnBoardingNav({
    super.key,
  });



  @override
  Widget build(BuildContext context) {
    final controller = OnBoardingController.instance;
    final dark = UNHelperFunctions.isDarkMode(context);
    return Positioned(
        bottom: 145,
        left: 160,
        child: SmoothPageIndicator(
          controller: controller.pageController,
          onDotClicked: controller.dotNavigationClick,
          count: 3,
          effect: ExpandingDotsEffect(activeDotColor: dark? UNColors.light: UNColors.dark, dotHeight: 6),
        ),
    );
  }
}