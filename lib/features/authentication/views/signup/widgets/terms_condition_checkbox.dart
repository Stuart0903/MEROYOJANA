
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/constants/text_strings.dart';
import '../../../../../utils/helpers/helpers.dart';
import '../../../controllers/signUp/signup_controller.dart';



class UNTermsAndConditioncheckbox extends StatelessWidget {
  const UNTermsAndConditioncheckbox({
    super.key,
  });


  @override
  Widget build(BuildContext context) {
    final controller = SignUpController.instance;
    final dark = UNHelperFunctions.isDarkMode(context);
    return Row(
      children: [
        SizedBox( width: 20, height: 24,
            child: Obx(
                    () =>  Checkbox(
                        value: controller.privaryPolicy.value,
                        onChanged: (value) => controller.privaryPolicy.value =!controller.privaryPolicy.value,
                    )
            )
        ),
        const SizedBox(width: UNSizes.spaceBtwInputFields,),
        Text.rich(
          TextSpan(
              children:[
                TextSpan(text:UNTexts.iAgreeTo,style: Theme.of(context).textTheme.bodySmall),
                TextSpan(text: UNTexts.privacyPolicy,style: Theme.of(context).textTheme.bodyMedium!.apply(
                  color: dark ? UNColors.textWhite : UNColors.primary,
                  decoration: TextDecoration.underline,
                  decorationColor: dark ? UNColors.textWhite : UNColors.primary,
                )),
                TextSpan(
                    text: UNTexts.and,style: Theme.of(context).textTheme.bodySmall
                ),
                TextSpan(text: UNTexts.termsofuse,style: Theme.of(context).textTheme.bodyMedium!.apply(
                    color: dark ? UNColors.textWhite : UNColors.primary,
                    decoration: TextDecoration.underline,
                    decorationColor: dark ? UNColors.textWhite : UNColors.primary
                ),),
              ]),
        ),
      ],
    );
  }
}
