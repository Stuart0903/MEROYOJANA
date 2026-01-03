
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ujyalonepal/features/authentication/views/signup/widgets/signup_form.dart';

import '../../../../common/widgets/login_signup/form_divider.dart';
import '../../../../common/widgets/login_signup/form_footer.dart';
import '../../../../utils/constants/sizes.dart';
import '../../../../utils/constants/text_strings.dart';
import '../../../../utils/helpers/helpers.dart';



class SignupView extends StatelessWidget {
  const SignupView({super.key});

  @override
  Widget build(BuildContext context) {
    final dark =UNHelperFunctions.isDarkMode(context);
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Padding(
            padding:EdgeInsets.all(UNSizes.defaultSpace),
            child: Column(
              crossAxisAlignment : CrossAxisAlignment.start,
              children: [
                ///title
                Text(UNTexts.signupTitle,style: Theme.of(context).textTheme.headlineMedium,),
                const SizedBox(height: UNSizes.spaceBtwSections,),

                ///form
                const UNsignupform(),
                const SizedBox(height: UNSizes.spaceBtwInputFields,),


                /// Divider
                UNLoginDivider(dividerText: UNTexts.orSignInWith.capitalize!),
                const SizedBox(height: UNSizes.spaceBtwInputFields,),

                /// Social Buttons
                const UNLoginFooter(),
                const SizedBox(height: UNSizes.spaceBtwInputFields,),


              ],
            )),
      ),

    );
  }
}


