
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../utils/constants/image_strings.dart';
import '../../../../utils/constants/sizes.dart';
import '../../../../utils/constants/text_strings.dart';
import '../../../../utils/helpers/helpers.dart';
import '../../controllers/forget_password/forget_password_controller.dart';
import '../login/login_view.dart';

class ResetPasswordView extends StatelessWidget {
  const  ResetPasswordView({super.key, required this.email});

  final String email;



  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [
          IconButton(onPressed: () => Get.back(), icon: const Icon(CupertinoIcons.clear))
        ],
      ),
      body : SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(UNSizes.defaultSpace),
          child: Column(
            children: [
              ///Image
              Image(image: const AssetImage(UNImages.deliveredImageIllustration), width: UNHelperFunctions.screenWidth() * 0.6),
              const SizedBox(height: UNSizes.spaceBtwSections,),

              ///Title and Subtitile
              Text(email, style: Theme.of(context).textTheme.bodyMedium, textAlign: TextAlign.center,),
              const SizedBox(height: UNSizes.spaceBtwItems,),
              Text(UNTexts.changeYourPasswordTitle, style: Theme.of(context).textTheme.headlineMedium, textAlign: TextAlign.center,),
              const SizedBox(height: UNSizes.spaceBtwItems,),
              Text(UNTexts.changeYourPasswordSubTitle, style: Theme.of(context).textTheme.labelMedium, textAlign: TextAlign.center,),
              const SizedBox(height: UNSizes.spaceBtwSections),

              ///Buttons
              SizedBox(width: double.infinity, child: ElevatedButton(onPressed: ()=> Get.offAll(()=> const LoginView()), child: const Text(UNTexts.done)),),
              const SizedBox(height: UNSizes.spaceBtwSections),

              SizedBox(
                width: double.infinity,
                child: ElevatedButton(onPressed: ()=> ForgetPasswordController.instance.resendPasswordResentEmail(email), child: const Text(UNTexts.resendEmail)),),

            ],
          ),

        ),
      )
    );
  }
}

