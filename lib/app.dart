
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:ujyalonepal/features/on_boarding_screen/views/on_boarding_view.dart';
import 'package:ujyalonepal/features/splash_screen/splash_view.dart';
import 'package:ujyalonepal/utils/constants/colors.dart';
import 'package:ujyalonepal/utils/theme/theme.dart';




class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        themeMode: ThemeMode.system,
        theme: UNAppTheme.lightTheme,
        darkTheme: UNAppTheme.darkTheme,
        debugShowCheckedModeBanner: false,
        // initialBinding: GeneralBindings(),
        ///show Loader or circular progress indicator
        home: SplashScreen(nextScreen: const Scaffold(
          backgroundColor: UNColors.primary,
          body: OnBoardingView()
        ))
        // home: const Scaffold(backgroundColor: UNColors.primary, body: Center(child: CircularProgressIndicator(color: Colors.white),),)
    );
  }
}
