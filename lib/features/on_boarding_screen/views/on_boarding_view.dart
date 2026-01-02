import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ujyalonepal/features/on_boarding_screen/views/widgets/onboarding_circbtn.dart';
import 'package:ujyalonepal/features/on_boarding_screen/views/widgets/onboarding_nav.dart';
import 'package:ujyalonepal/features/on_boarding_screen/views/widgets/onboarding_page.dart';
import 'package:ujyalonepal/features/on_boarding_screen/views/widgets/onboarding_skip.dart';
import 'package:ujyalonepal/utils/constants/image_strings.dart';

import '../../../utils/constants/text_strings.dart';
import '../controllers/onboarding_controller.dart';

class OnBoardingView extends StatelessWidget {
  const OnBoardingView({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(OnBoardingController());
    return Scaffold(
      body: Stack(
        children: [
          PageView(
            controller: controller.pageController,
            onPageChanged: controller.updatePageIndicator,
            children: const [
              OnBoardingPage(
                image: UNImages.onBoardingImage1,
                heading: UNTexts.onBoardingTitle1,
                subheading: UNTexts.onBoardingSubTitle1,
              ),
              OnBoardingPage(
                image: UNImages.onBoardingImage2,
                heading: UNTexts.onBoardingTitle2,
                subheading: UNTexts.onBoardingSubTitle2,
              ),
              OnBoardingPage(
                image: UNImages.onBoardingImage3,
                heading: UNTexts.onBoardingTitle3,
                subheading: UNTexts.onBoardingSubTitle3,
              )
            ],

          ),

          /// Skip Button
          const OnboardingSkip(),

          ///Dot Navigation SmoothPage Indicator
          OnBoardingNav(),

          ///Circular Button
          OnBoardingCircBtn(),


        ]
      )

    );
  }
}
