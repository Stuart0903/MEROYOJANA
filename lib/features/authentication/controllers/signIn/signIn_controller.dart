import 'package:flutter/cupertino.dart';
import 'package:get/get.dart%20';
import 'package:get_storage/get_storage.dart';


import '../../../../data/repo/authentication/auth_repo.dart';
import '../../../../data/repo/user/user_repo.dart';
import '../../../../utils/constants/image_strings.dart';
import '../../../../utils/https/network_manager.dart';
import '../../../../utils/popups/full_screenLoader.dart';
import '../../../../utils/popups/loaders.dart';
import '../../../personalization/controllers/user_conntroller.dart';

class SignInController extends GetxController{
  ///Variables
  final rememberMe = false.obs;
  final hidePassword = true.obs;
  final localStorage = GetStorage();
  final email = TextEditingController();
  final password = TextEditingController();
  GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();
  final userController = Get.put(UserController());





  ///Email and password sign In
  // Future<void>emailAndPasswordSignIn() async{
  //   try{
  //     //Check Internet Connectivity
  //     final isConnected = await NetworkManager.instance.isConnected();
  //     if(!isConnected){
  //       UNFullScreenLoader.stopLoading();
  //       return;
  //     }
  //
  //     //Start loading
  //     UNFullScreenLoader.openLoadingDialog('Logging in....', UNImages.fullScreenloader);
  //
  //     // Form Validation
  //     if (loginFormKey.currentState == null || !loginFormKey.currentState!.validate()) {
  //       UNFullScreenLoader.stopLoading();
  //       return;
  //     }
  //
  //     //Save Data if Remember Me is selected
  //     if(rememberMe.value){
  //       localStorage.write("REMEMBER_ME_EMAIL", email.text.trim());
  //       localStorage.write("REMEMBER_ME_PASSWORD", password.text.trim());
  //     }
  //
  //     //Login user using Email and password authentication
  //     final userCredentials = await AuthenticationRepository.instance.loginWithEmailAndPassword(email.text.trim(), password.text.trim());
  //
  //     //Remove Loader
  //     UNFullScreenLoader.stopLoading();
  //
  //     //Redirect
  //     AuthenticationRepository.instance.screenRedirect();
  //   }catch(e){
  //     UNFullScreenLoader.stopLoading();
  //     UNLoaders.errorSnackBar(title: "Oh Shoot!!", message: e.toString());
  //   }
  // }

  ///GOogle signIn Authentication
  // Future<void>googleSignIn()async{
  //   try{
  //
  //     UNFullScreenLoader.openLoadingDialog('Logging you in....', UNImages.lightAppLogo);
  //
  //     //Check Internet Connectivity
  //     final isConnected = await NetworkManager.instance.isConnected();
  //     if(!isConnected){
  //       UNFullScreenLoader.stopLoading();
  //       return;
  //     }
  //
  //     //Google Authentication
  //     final userCredentials = await AuthenticationRepository.instance.signInWithGoogle();
  //
  //     // //Save User Record
  //     // await userController.saveUserRecord(userCredentials);
  //
  //     // Check if user already exists in Firestore
  //     final userRepo = UserRepository.instance;
  //     final userDoc = await userRepo.fetchUserDetails();
  //
  //     if (userDoc.id.isEmpty) {
  //       // User does not exist, save new user record
  //       await userController.saveUserRecord(userCredentials);
  //     } else {
  //       // User exists, update local state with existing data
  //       userController.user(userDoc);
  //     }
  //
  //     //Remove loaders
  //     UNFullScreenLoader.stopLoading();
  //
  //     //Redirect
  //     AuthenticationRepository.instance.screenRedirect();
  //
  //   }catch(e){
  //     //Remove loaders
  //     UNFullScreenLoader.stopLoading();
  //     UNLoaders.errorSnackBar(title: 'Oh Shoot', message: e.toString());
  //   }
  // }

}