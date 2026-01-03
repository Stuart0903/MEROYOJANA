import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../../../data/repo/authentication/auth_repo.dart';
import '../../../../utils/https/network_manager.dart';
import '../../../../utils/popups/full_screenLoader.dart';
import '../../../../utils/popups/loaders.dart';
import '../../views/password_configuration/reset_password.dart';


class ForgetPasswordController extends GetxController{
  static ForgetPasswordController get instance => Get.find();

  ///Variables
  final email = TextEditingController();
  GlobalKey<FormState> forgetPasswordFormKey = GlobalKey<FormState>();

  ///send Reset Password Email
  sendPasswordResetEmail()async{
    try {
      //Check Internet Connectivity
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        UNFullScreenLoader.stopLoading();
        return;
      }

      // Form Validation
      if(!forgetPasswordFormKey.currentState!.validate()){
        UNFullScreenLoader.stopLoading();
        return;
      }

      //Send Email to Reset Password
      await AuthenticationRepository.instance.sendPasswordResetEmail(email.text.trim());

      //Remove Loader
      UNFullScreenLoader.stopLoading();

      //Show Success Message
      UNLoaders.successSnackBar(title: 'Email Sent', message: 'Email Link Sent to Reset your Password');

      // Redirect
      Get.to(()=> ResetPasswordView(email: email.text.trim()));


    }catch(e){
      UNFullScreenLoader.stopLoading();
      UNLoaders.errorSnackBar(title: 'Error', message: e.toString());
    }
  }

  resendPasswordResentEmail(String email)async {
    try {
      //Check Internet Connectivity
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        UNFullScreenLoader.stopLoading();
        return;
      }


      //Send Email to Reset Password
      await AuthenticationRepository.instance.sendPasswordResetEmail(email);

      //Remove Loader
      UNFullScreenLoader.stopLoading();

      //Show Success Message
      UNLoaders.successSnackBar(title: 'Email Sent',
          message: 'Email Link Sent to Reset your Password');
    } catch (e) {
      UNFullScreenLoader.stopLoading();
      UNLoaders.errorSnackBar(title: 'Error', message: e.toString());
    }
  }
}