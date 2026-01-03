
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/constants/text_strings.dart';
import '../../../../../utils/validators/validation.dart';
import '../../../controllers/signIn/signIn_controller.dart';
import '../../password_configuration/forgot_password.dart';
import '../../signup/signup_view.dart';


class UNLoginForm extends StatelessWidget {
  const UNLoginForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SignInController());
    return Form(
        key: controller.loginFormKey,
        child:
        Padding(
          padding: const EdgeInsets.symmetric(vertical: UNSizes.spaceBtwSections +10),
          child: Column(
            children: [
              ///Email
              TextFormField(
                controller: controller.email,
                validator: (value) => UNValidators.validateEmail(value),
                decoration:InputDecoration(
                    prefixIcon: Icon(CupertinoIcons.mail),
                    labelText: UNTexts.email,
                    labelStyle: Theme.of(context).textTheme.bodyMedium,
                    floatingLabelStyle: Theme.of(context).textTheme.bodyMedium
                ),
              ),
              const SizedBox(height: UNSizes.spaceBtwInputFields,),
              ///Password
              Obx(
                    ()=> TextFormField(
                  controller: controller.password,
                  validator: (value) => UNValidators.validatePassword(value),
                  obscureText: controller.hidePassword.value,
                  decoration: InputDecoration(
                      labelText: UNTexts.password,
                      prefixIcon: Icon(Iconsax.password_check),
                      suffixIcon: IconButton(
                        onPressed: ()=> controller.hidePassword.value =!controller.hidePassword.value,
                        icon: Icon(controller.hidePassword.value? Iconsax.eye_slash : Iconsax.eye),

                      ),
                      labelStyle: Theme.of(context).textTheme.bodyMedium,
                      floatingLabelStyle: Theme.of(context).textTheme.bodyMedium
                  ),
                ),
              ),
              const SizedBox(height: UNSizes.spaceBtwInputFields/2,),

              ///Remember Me and forgot password
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Obx(
                            ()=>
                            Checkbox(
                                value: controller.rememberMe.value,
                                onChanged:(value) => controller.rememberMe.value =! controller.rememberMe.value),
                      ),
                      const Text(UNTexts.rememberMe)
                    ],
                  ),
                  TextButton(onPressed: () =>Get.to(() => const ForgotPassword()), child: Text(UNTexts.forgetPassword))
                ],
              ),
              const SizedBox(height: UNSizes.spaceBtwSections,),

              ///Sign In Button
              SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                      onPressed: ()=> controller.emailAndPasswordSignIn(),
                      child: Text(UNTexts.signIn))),
              const SizedBox(height: UNSizes.spaceBtwItems),

              ///Create Account Button
              SizedBox(
                width: double.infinity,
                child: OutlinedButton(onPressed: () => Get.to(SignupView()), child: const Text(UNTexts.createAccount)),

              )
            ],

          ),
        )
    );
  }
}