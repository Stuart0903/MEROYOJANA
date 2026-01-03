
import 'package:flutter/material.dart';
import 'package:get/get.dart';


import '../../../../common/widgets/login_signup/form_divider.dart';
import '../../../../common/widgets/login_signup/form_footer.dart';
import '../../../../utils/constants/sizes.dart';
import '../../../../utils/constants/text_strings.dart';
import '../../../../utils/helpers/helpers.dart';
import 'widgets/login_form.dart';
import 'widgets/login_header.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = UNHelperFunctions.isDarkMode(context);
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(top: UNSizes.appBarHeight, left: UNSizes.defaultSpace, right: UNSizes.defaultSpace, bottom: UNSizes.defaultSpace),
          child: Column(
            children: [
              ///Header with Logo, logo header, logo sub header
              const UNLoginHeader(),

              ///Form
              const UNLoginForm(),

              ///Divider
              UNLoginDivider(dividerText: UNTexts.orSignInWith.capitalize!,),

              const SizedBox(height: UNSizes.spaceBtwSections,),

              ///Footer
              UNLoginFooter(),

            ],
          ),
        ),
      ),
    );
  }
}








