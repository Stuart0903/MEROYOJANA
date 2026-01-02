
import 'package:flutter/material.dart';

import '../../../../utils/constants/sizes.dart';
import '../../../../utils/helpers/helpers.dart';


class OnBoardingPage extends StatelessWidget {
  const OnBoardingPage({
    super.key, required this.image, required this.heading, required this.subheading,
  });

  final String image, heading, subheading;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(UNSizes.defaultSpace),
      child: Column(
        children: [
          Image(
            width: UNHelperFunctions.screenWidth() * 0.8,
            height: UNHelperFunctions.screenHeight() * 0.6,
            image: AssetImage(image),
          ),
          Text(
            heading,
            style: Theme.of(context).textTheme.headlineMedium,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 16.0),
          Text(
            subheading,
            style: Theme.of(context).textTheme.bodyMedium,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}