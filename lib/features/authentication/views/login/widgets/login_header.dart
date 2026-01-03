
import 'package:flutter/material.dart';

import '../../../../../utils/constants/image_strings.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/constants/text_strings.dart';
import '../../../../../utils/helpers/helpers.dart';


class UNLoginHeader extends StatelessWidget {
  const UNLoginHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final dark = UNHelperFunctions.isDarkMode(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Center(child: Image(height: 100, image: AssetImage(dark? UNImages.darkAppLogo : UNImages.lightAppLogo))),
        const SizedBox(height: UNSizes.md),
        Text(UNTexts.loginTitle,
            style: Theme.of(context).textTheme.headlineMedium),
        const SizedBox(height: UNSizes.sm,),
        Text(UNTexts.loginSubTitle,
            style: Theme.of(context).textTheme.bodyMedium),
      ],
    );
  }
}