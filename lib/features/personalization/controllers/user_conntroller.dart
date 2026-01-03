import 'dart:io';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:ujyalonepal/features/personalization/controllers/update_details/reauthenticate_user_form.dart';

import '../../../data/repo/authentication/auth_repo.dart';
import '../../../data/repo/user/user_repo.dart';
import '../../../utils/constants/image_strings.dart';
import '../../../utils/constants/sizes.dart';
import '../../../utils/helpers/cloudanairy_service.dart';
import '../../../utils/https/network_manager.dart';
import '../../../utils/popups/full_screenLoader.dart';
import '../../../utils/popups/loaders.dart';
import '../../authentication/models/user_model.dart';
import '../../authentication/views/login/login_view.dart';
import 'package:image_picker/image_picker.dart';


class UserController extends GetxController{
  static UserController get instance => Get.find();

  final profileLoading = false.obs;

  Rx<UserModel> user = UserModel.empty().obs;

  // Cloudinary service instance
  final CloudinaryService _cloudinaryService = CloudinaryService();

  final hidePassword = false.obs;
  final verifyEmail = TextEditingController();
  final verifyPassword = TextEditingController();
  final currentPassword = TextEditingController();
  final newPassword = TextEditingController();
  final confirmNewPassword = TextEditingController();
  final userRepsitory = Get.put(UserRepository());
  final authRepo = Get.put(AuthenticationRepository());
  GlobalKey<FormState> reAuthFormKey = GlobalKey<FormState>();
  // Form Key for Password Update
  final GlobalKey<FormState> updatePasswordFormKey = GlobalKey<FormState>();

  @override
  void onInit(){
    super.onInit();
    fetchUserRecord();
  }

  ///Fetch user record
  Future<void> fetchUserRecord()async{
    try{
      profileLoading.value = true;
      final user = await userRepsitory.fetchUserDetails();
      print('Fetched User Data: ${user.toJson()}'); // Debugging
      this.user(user);
      profileLoading.value = false;
    }catch(e){
      user(UserModel.empty());
    }finally{
      profileLoading.value = false;
    }
  }

  ///Save user Record from any Registration provider
  Future<void> saveUserRecord(UserCredential? userCredentials) async {
    try{
      if(userCredentials != null){
        //Convert Name to First and Last Name
        final nameParts = UserModel.nameParts(userCredentials.user!.displayName?? '');
        final username = UserModel.generateUsername(userCredentials.user!.displayName?? '');

        //Map Data
        final user = UserModel(
          id: userCredentials.user!.uid,
          firstName: nameParts[0],
          lastName: nameParts.length > 1 ? nameParts.sublist(1).join(" ") : "",
          userName: username,
          email: userCredentials.user!.email ?? "",
          phoneNumber: userCredentials.user!.phoneNumber ?? "",
          profilePicture: userCredentials.user!.photoURL ?? "",
          gender: "",
          dateOfBirth: "",
          address: "",
        );

        //save user data
        await userRepsitory.saveUserRecord(user);
      }
    }catch(e){
      UNLoaders.warningSnackBar(
        title: 'Data not Saved',
        message: 'Something went wrong while saving your information. You can re-save your data in your Profile',
      );
    }
  }

  ///Delete Account Warning
  void deleteAccountWarningPopup(){
    Get.defaultDialog(
      contentPadding: const EdgeInsets.all(UNSizes.md),
      title: 'Delete Account',
      middleText:'Are you sure want to delete your account permanently? This action is not reversible and all your data will be removed permanently',
      confirm: ElevatedButton(
          onPressed: () async => deleteUserAccount(),
          style: ElevatedButton.styleFrom(backgroundColor: Colors.red, side: const BorderSide(color: Colors.red)),
          child: const Padding(padding: EdgeInsets.symmetric(horizontal: UNSizes.lg), child: Text('Delete'))
      ),
      cancel: OutlinedButton(
          onPressed: ()=> Navigator.of(Get.overlayContext!).pop(),
          child: const Text('Cancel'),
      )
    );
  }

  ///Delete Account Warning
  void logoutPopUp(){
    final auth = AuthenticationRepository.instance;
    Get.defaultDialog(
        contentPadding: const EdgeInsets.all(UNSizes.md),
        title: 'Logout',
        middleText:'Are you sure want to logout your account',
        confirm: ElevatedButton(
            onPressed: () async => auth.logout(),
            style: ElevatedButton.styleFrom(backgroundColor: Colors.red, side: const BorderSide(color: Colors.red)),
            child: const Padding(padding: EdgeInsets.symmetric(horizontal: UNSizes.lg), child: Text('Logout'))
        ),
        cancel: OutlinedButton(
          onPressed: ()=> Navigator.of(Get.overlayContext!).pop(),
          child: const Text('Cancel'),
        )
    );
  }

  ///Delete User Account
  void deleteUserAccount() async{
    try{
      final auth = AuthenticationRepository.instance;
      final provider = auth.authUser!.providerData.map((e)=> e.providerId).first;
      if(provider.isNotEmpty){
        //Re Verify Auth Email
        if (provider == 'google.com'){
          await auth.signInWithGoogle();
          await auth.deleteAccount();
          Get.offAll(()=> const LoginView());
        }else if(provider == 'password'){
          Get.to(()=> const ReauthenticateUserFormView());
        }
      }
    } catch(e){
      UNLoaders.errorSnackBar(title: 'Error', message: e.toString());
    }
  }

  Future<void> reAuthenticateEmailAndPasswordUser() async{
    try{
      UNFullScreenLoader.openLoadingDialog('Processing', UNImages.loadingAnimation);
      //Check Internet
      final isConnected = await NetworkManager.instance.isConnected();
      if(!isConnected){
        return;
      }
      if (!reAuthFormKey.currentState!.validate()){
        UNFullScreenLoader.stopLoading();
        return;
      }

      await AuthenticationRepository.instance.reAuthenticateWithEmailAndPassword(verifyEmail.text.trim(), verifyPassword.text.trim());
      await AuthenticationRepository.instance.deleteAccount();
      UNFullScreenLoader.stopLoading();
      Get.offAll(()=> const LoginView());
    }catch(e){
      UNFullScreenLoader.stopLoading();
      UNLoaders.warningSnackBar(title: 'Oh Snap', message: e.toString());
    }
  }


  /// Upload and update profile picture
  Future<void> uploadProfilePicture() async {
    try {
      // Pick image from gallery
      final picker = ImagePicker();
      final pickedFile = await picker.pickImage(source: ImageSource.gallery);
      if (pickedFile == null) return;

      // Upload image to Cloudinary
      final imageUrl = await _cloudinaryService.uploadImage(File(pickedFile.path));
      if (imageUrl.isEmpty) throw 'Failed to upload image';

      // Update user's profile picture URL in Firebase
      await userRepsitory.updateSingleField({'profilePicture': imageUrl});

      // Update the local user object
      user.update((val) {
        val?.profilePicture = imageUrl;
      });

      UNLoaders.successSnackBar(title: 'Success', message: 'Profile picture updated successfully');
    } catch (e) {
      UNLoaders.errorSnackBar(title: 'Error', message: e.toString());
    }
  }


  /// Update Password
  Future<void> updatePassword() async {
    try {
      // Check Internet Connectivity
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        UNLoaders.warningSnackBar(title: 'No Internet', message: 'Please check your internet connection');
        return;
      }

      // Form Validation
      if (!updatePasswordFormKey.currentState!.validate()) return;

      // Check if New Password and Confirm New Password match
      if (newPassword.text.trim() != confirmNewPassword.text.trim()) {
        UNLoaders.errorSnackBar(title: 'Error', message: 'New passwords do not match');
        return;
      }

      // Handle Google Sign-In Users
      if (authRepo.isGoogleUser()) {
        // Link Google account with Email/Password credential
        await authRepo.linkGoogleAccountWithPassword(newPassword.text.trim());
      } else {
        // Handle Email/Password Users
        final isCurrentPasswordValid = await authRepo.verifyCurrentPassword(
          currentPassword.text.trim(),
        );

        if (!isCurrentPasswordValid) {
          UNLoaders.errorSnackBar(title: 'Error', message: 'Current password is incorrect');
          return;
        }

        // Update Password in Firebase Authentication
        await authRepo.updatePassword(newPassword.text.trim());
      }

      // Show Success Message
      UNLoaders.successSnackBar(title: 'Success', message: 'Your password has been updated');

      // Navigate back to Profile View
      Get.off(() => const LoginView());
    } catch (e) {
      UNLoaders.errorSnackBar(title: 'Error', message: e.toString());
    }
  }





}

