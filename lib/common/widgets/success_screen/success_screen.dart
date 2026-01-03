
import 'package:flutter/material.dart';
import 'package:get/get.dart';


import '../../../features/authentication/views/login/login_view.dart';
import '../../../utils/constants/sizes.dart';
import '../../../utils/helpers/helpers.dart';
import '../../styles/spacing_style.dart';


class SuccessScreen extends StatelessWidget {
  const SuccessScreen({super.key, required this.image, required this.title, required this.subTitle, required this.onPressed});
  final String image, title, subTitle;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
         child: Padding(
           padding: UNSpacingStyles.paddingWithAppBarHeight *2,
           child: Column(
             children: [
               ///Image
               Image(image: AssetImage(image), width: UNHelperFunctions.screenWidth() * 0.6),
               const SizedBox(height: UNSizes.spaceBtwSections,),

               ///Title and Subtitile
               Text(title, style: Theme.of(context).textTheme.headlineMedium, textAlign: TextAlign.center,),
               const SizedBox(height: UNSizes.spaceBtwItems,),
               Text(subTitle, style: Theme.of(context).textTheme.labelMedium, textAlign: TextAlign.center,),
               const SizedBox(height: UNSizes.spaceBtwSections),

               ///Buttons
               SizedBox(width: double.infinity, child: ElevatedButton(onPressed: ()=> Get.to(()=> const LoginView()), child: const Text("Continue")),),




             ],
           ),
         ),

      ),
    );
  }
}

