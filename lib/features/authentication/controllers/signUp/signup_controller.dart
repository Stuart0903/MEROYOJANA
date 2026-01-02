import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../../../data/repo/authentication/auth_repo.dart';
import '../../../../utils/constants/image_strings.dart';
import '../../../../utils/https/network_manager.dart';
import '../../../../utils/popups/full_screenLoader.dart';
import '../../../../utils/popups/loaders.dart';


class SignUpController extends GetxController{
  static SignUpController get instance => Get.find();

  ///Variables
  final hidePassword = true.obs;
  final privaryPolicy = true.obs;
  final selectedGender = ''.obs;
  final email = TextEditingController();
  final firstName = TextEditingController();
  final lastName = TextEditingController();
  final userName = TextEditingController();
  final password = TextEditingController();
  final phoneNumber = TextEditingController();
  final dateOfBirth = TextEditingController();
  final address = TextEditingController();

  GlobalKey<FormState> signupFormkey = GlobalKey<FormState>();

  /// Date picker function
  void selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now().subtract(const Duration(days: 365 * 18)), // Default to 18 years ago
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );

    if (picked != null) {
      dateOfBirth.text = DateFormat('yyyy-MM-dd').format(picked);
    }
  }

  /// SignUp
  void signup(){
    debugPrint('Signup button Clicked');
  }

  @override
  void onClose() {
    email.dispose();
    firstName.dispose();
    lastName.dispose();
    userName.dispose();
    password.dispose();
    phoneNumber.dispose();
    dateOfBirth.dispose();
    address.dispose();
    super.onClose();
  }
}