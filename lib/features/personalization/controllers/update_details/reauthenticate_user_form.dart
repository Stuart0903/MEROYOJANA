import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../common/widgets/appbar/appbar.dart';
import '../../../../utils/constants/sizes.dart';
import '../../../../utils/constants/text_strings.dart';
import '../../../../utils/validators/validation.dart';
import '../user_conntroller.dart';

class ReauthenticateUserFormView extends StatelessWidget {
  const ReauthenticateUserFormView({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = UserController.instance;
    return Scaffold(
      appBar: const UNAppBar(title: Text('Re-Authenticate User'), showBackArrow: true,),
      body: SingleChildScrollView(
        child: Padding(
            padding: const EdgeInsets.all(UNSizes.defaultSpace),
          child: Form(
            key: controller.reAuthFormKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ///Email
                TextFormField(
                  controller: controller.verifyEmail,
                  validator: UNValidators.validateEmail,
                  decoration: const InputDecoration(
                    prefixIcon: Icon(Iconsax.direct_right),
                    labelText: UNTexts.email,
                  ),
                ),
                const SizedBox(height: UNSizes.spaceBtwInputFields),

                ///Password
                Obx(
                    ()=> TextFormField(
                      obscureText: controller.hidePassword.value,
                      controller: controller.verifyPassword,
                      validator: (value)=> UNValidators.validateEmptyText('Password', value),
                      decoration: InputDecoration(
                        labelText: UNTexts.password,
                        prefixIcon: const Icon(Iconsax.password_check),
                        suffixIcon: IconButton(
                          onPressed: ()=> controller.hidePassword.value =! controller.hidePassword.value,
                          icon: const Icon(Iconsax.eye_slash),
                        )
                      ),
                    )
                ),
                const SizedBox(height: UNSizes.spaceBtwSections),

                ///Login Button
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                      onPressed: ()=> controller.reAuthenticateEmailAndPasswordUser(), child: const Text('Verify')
                  )
                )
              ],
            )
          ),
        )
      )

    );
  }
}
