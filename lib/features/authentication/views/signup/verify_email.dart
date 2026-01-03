
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../data/repo/authentication/auth_repo.dart';
import '../../../../utils/constants/sizes.dart';
import '../../../../utils/constants/text_strings.dart';
import '../../../../utils/helpers/helpers.dart';
import '../../controllers/signUp/verifyEmail_controller.dart';


class VerifyEmailView extends StatelessWidget {
  const VerifyEmailView({super.key, this.email});
  final String? email;


  @override
  Widget build(BuildContext context) {
    final controller = Get.put(VerifyEmailController());
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [
          IconButton(onPressed: ()=> AuthenticationRepository.instance.logout(), icon: const Icon(CupertinoIcons.clear))
        ],
      ),
      body:SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(UNSizes.defaultSpace),
          child: Column(
            children: [
              ///Image
              Image(image: const AssetImage('assets/images/verification_images/verifyEmail.png'), width: UNHelperFunctions.screenWidth() * 0.6),
              const SizedBox(height: UNSizes.spaceBtwSections,),

              ///Title and Subtitile
              Text(UNTexts.verifyEmailTitle, style: Theme.of(context).textTheme.headlineMedium, textAlign: TextAlign.center,),
              const SizedBox(height: UNSizes.spaceBtwItems,),
              Text(email?? '', style: Theme.of(context).textTheme.labelLarge, textAlign: TextAlign.center,),
              const SizedBox(height: UNSizes.spaceBtwItems,),
              Text(UNTexts.verifyEmailSubtitle, style: Theme.of(context).textTheme.labelMedium, textAlign: TextAlign.center,),
              const SizedBox(height: UNSizes.spaceBtwSections),

              ///Buttons
              SizedBox(width: double.infinity, child: ElevatedButton(
                  onPressed: () => controller.checkEmailVerificationStatus(),
                child: const Text("Verify"),
                )
              ),
              const SizedBox(height: UNSizes.spaceBtwItems,),
              SizedBox(width: double.infinity, child: TextButton(onPressed: () => controller.sendEmailVerification(), child: const Text(UNTexts.resendEmail)),)

            ],
          ),
        ),
      ),
    );
  }
}

