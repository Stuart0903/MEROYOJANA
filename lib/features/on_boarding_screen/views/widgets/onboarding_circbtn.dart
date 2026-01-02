
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../utils/constants/sizes.dart';
import '../../../../utils/helpers/helpers.dart';
import '../../controllers/onboarding_controller.dart';


class OnBoardingCircBtn extends StatelessWidget {
  const OnBoardingCircBtn({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final dark = UNHelperFunctions.isDarkMode(context);
    return Positioned(
        right: UNSizes.defaultSpace,
        bottom: kBottomNavigationBarHeight,
        child: ElevatedButton(
            onPressed: ()=> OnBoardingController.instance.nextPage(),
            style: ElevatedButton.styleFrom(shape: CircleBorder(), backgroundColor: dark? Colors.white70: Colors.black),
            child: Icon(Iconsax.arrow_right_3, color: dark? Colors.black: Colors.white))
    );
  }
}