


import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:ujyalonepal/features/on_boarding_screen/views/on_boarding_view.dart';

class AuthenticationRepository extends GetxController{
  static AuthenticationRepository get instance => Get.find();

  ///Variables
  final deviceStorage = GetStorage();
  final _auth = FirebaseAuth.instance;

  ///Get Authenticated User Data
  User? get authUser => _auth.currentUser;

  ///Call from main.dart on app launch
  @override
  void onReady(){
    // FlutterNativeSplash.remove();
    screenRedirect();
  }

  screenRedirect(){
    OnBoardingView();

  }
  }