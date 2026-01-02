
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get_storage/get_storage.dart';

import 'app.dart';
import 'package:get/get.dart';

import 'data/repo/authentication/auth_repo.dart';
import 'firebase_options.dart';

Future<void> main() async {
  //
  //Todo: Add Widgets Binding
  final WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();

  //Todo: Init Local Storage
  await GetStorage.init();

  //Todo: Await Native Splash


  // //Todo: Initialize Firebase
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform).then(
        (FirebaseApp value) => Get.put(AuthenticationRepository()),
  );



  //Todo: Initialize Authentication
  runApp(const MyApp());
}