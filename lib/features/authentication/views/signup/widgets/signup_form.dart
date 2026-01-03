import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:iconsax/iconsax.dart';
import 'package:ujyalonepal/features/authentication/views/signup/widgets/terms_condition_checkbox.dart';


import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/constants/text_strings.dart';
import '../../../../../utils/validators/validation.dart';
import '../../../controllers/signUp/signup_controller.dart';

class UNsignupform extends StatelessWidget {
  const UNsignupform({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SignUpController());
    return Form(
      key: controller.signupFormkey,
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: TextFormField(
                  controller: controller.firstName,
                  validator: (value) => UNValidators.validateEmptyText('First Name', value),
                  expands:false,
                  decoration: InputDecoration(
                      labelText: UNTexts.firstName,
                      prefixIcon: Icon(Iconsax.user),
                      labelStyle: Theme.of(context).textTheme.bodyMedium,
                      floatingLabelStyle: Theme.of(context).textTheme.bodyMedium
                  ),
                ),
              ),
              const SizedBox(width:  UNSizes.spaceBtwInputFields,),
              Expanded(
                child: TextFormField(
                  controller: controller.lastName,
                  validator: (value) => UNValidators.validateEmptyText('Last Name', value),
                  expands:false,
                  decoration: InputDecoration(
                      labelText: UNTexts.lastName,
                      prefixIcon: Icon(Iconsax.user),
                      labelStyle: Theme.of(context).textTheme.bodyMedium,
                      floatingLabelStyle: Theme.of(context).textTheme.bodyMedium
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: UNSizes.spaceBtwInputFields,),

          ///Username
          TextFormField(
            controller: controller.userName,
            validator: (value) => UNValidators.validateEmptyText('Username', value),
            expands: false,
            decoration: InputDecoration(
                labelText: UNTexts.username,prefixIcon: Icon(Iconsax.user_edit), labelStyle: Theme.of(context).textTheme.bodyMedium,
                floatingLabelStyle: Theme.of(context).textTheme.bodyMedium),
          ),
          const SizedBox(height: UNSizes.spaceBtwInputFields,),

          /// Gender DropdoUN
          Obx(() =>
              DropdownButtonFormField<String>(
                value: controller.selectedGender.value.isEmpty ? null : controller.selectedGender.value,
                decoration: InputDecoration(
                  labelText: 'Gender',
                  prefixIcon: Icon(Iconsax.profile_2user),
                  labelStyle: Theme.of(context).textTheme.bodyMedium,
                  floatingLabelStyle: Theme.of(context).textTheme.bodyMedium,
                ),
                validator: (value) => UNValidators.validateEmptyText('Gender', value),
                items: ['Male', 'Female', 'Other', 'Prefer not to say'].map((gender) =>
                    DropdownMenuItem(
                      value: gender,
                      child: Text(gender),
                    )
                ).toList(),
                onChanged: (value) {
                  if (value != null) controller.selectedGender.value = value;
                },
              ),
          ),
          const SizedBox(height: UNSizes.spaceBtwInputFields,),

          /// Date of Birth
          GestureDetector(
            onTap: () => controller.selectDate(context),
            child: AbsorbPointer(
              child: TextFormField(
                controller: controller.dateOfBirth,
                validator: (value) => UNValidators.validateEmptyText('Date of Birth', value),
                decoration: InputDecoration(
                  labelText: 'Date of Birth',
                  prefixIcon: Icon(Iconsax.calendar),
                  labelStyle: Theme.of(context).textTheme.bodyMedium,
                  floatingLabelStyle: Theme.of(context).textTheme.bodyMedium,
                ),
              ),
            ),
          ),
          const SizedBox(height: UNSizes.spaceBtwInputFields,),

          ///Address
          TextFormField(
            controller: controller.address,
            validator: (value) => UNValidators.validateEmptyText('Address', value),
            expands: false,
            decoration:InputDecoration(
                labelText: UNTexts.address,
                prefixIcon: Icon(Iconsax.location),
                labelStyle: Theme.of(context).textTheme.bodyMedium,
                floatingLabelStyle: Theme.of(context).textTheme.bodyMedium
            ),
          ),
          const SizedBox(height: UNSizes.spaceBtwInputFields,),

          ///Email
          TextFormField(
            controller: controller.email,
            validator: (value) => UNValidators.validateEmail(value),
            expands: false,
            decoration: InputDecoration(
                labelText: UNTexts.email,
                prefixIcon: Icon(Iconsax.direct),
                labelStyle: Theme.of(context).textTheme.bodyMedium,
                floatingLabelStyle: Theme.of(context).textTheme.bodyMedium
            ),
          ),
          const SizedBox(height: UNSizes.spaceBtwInputFields,),

          ///PhoneNumber
          TextFormField(
            controller: controller.phoneNumber,
            validator: (value) => UNValidators.validatePhoneNumber(value),
            expands: false,
            decoration: InputDecoration(
                labelText: UNTexts.phoneNo,
                prefixIcon: Icon(Iconsax.call),
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
                    onPressed: ()=> controller.hidePassword.value = !controller.hidePassword.value,
                    icon: Icon(controller.hidePassword.value? Iconsax.eye_slash : Iconsax.eye),
                  ),
                  labelStyle: Theme.of(context).textTheme.bodyMedium,
                  floatingLabelStyle: Theme.of(context).textTheme.bodyMedium
              ),
            ),
          ),
          const SizedBox(height: UNSizes.spaceBtwInputFields,),

          ///Termconditions Checkbox
          UNTermsAndConditioncheckbox(),
          const SizedBox(height: UNSizes.spaceBtwInputFields,),

          /// Sign Up Button
          SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: ()=> controller.signup(),
                child: const Text(UNTexts.createAccount),
              )
          )
        ],
      ),
    );
  }
}