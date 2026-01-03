
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../features/authentication/controllers/signIn/signIn_controller.dart';
import '../../../utils/constants/image_strings.dart';
import '../../../utils/constants/sizes.dart';


class UNLoginFooter extends StatelessWidget {
  const UNLoginFooter({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SignInController());
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          decoration: BoxDecoration(border: Border.all(color: Colors.grey), borderRadius: BorderRadius.circular(100)),
          child:
          IconButton(
            // onPressed: ()=> Text("hello world"),
              onPressed: () => controller.googleSignIn(),
              icon: const Image(
                  width: UNSizes.iconMd,
                  height: UNSizes.iconMd,
                  image: AssetImage(UNImages.googleIcon)
              )),
        ),
        const SizedBox(width: UNSizes.spaceBtwItems,),
        Container(
          decoration: BoxDecoration(border: Border.all(color: Colors.grey), borderRadius: BorderRadius.circular(100)),
          child: IconButton(onPressed: (){},
              icon: const Image(
                  width: UNSizes.iconMd,
                  height: UNSizes.iconMd,
                  image: AssetImage(UNImages.facebookIcon)
              )),
        ),

      ],
    );
  }
}
