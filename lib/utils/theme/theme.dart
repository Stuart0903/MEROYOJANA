
import 'package:flutter/material.dart';
import 'custom_themes/appbar_theme.dart';
import 'custom_themes/bottom_sheet_theme.dart';
import 'custom_themes/checkbox_theme.dart';
import 'custom_themes/chip_theme.dart';
import 'custom_themes/elevated_button_theme.dart';
import 'custom_themes/outline_button_theme.dart';
import 'custom_themes/text_field_theme.dart';
import 'custom_themes/text_theme.dart';

class UNAppTheme{
  UNAppTheme._();
  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    fontFamily: 'Poppins',
    brightness: Brightness.light,
    primaryColor: Colors.lightGreen,
    scaffoldBackgroundColor: Colors.white,
    textTheme: UNTextTheme.lightTextTheme,
    chipTheme: UNChipTheme.lightChipTheme,
    appBarTheme: UNAppBarTheme.lightAppBarTheme,
    checkboxTheme: UNCheckBoxTheme.lightCheckBoxTheme,
    bottomSheetTheme: UNBottomSheetTheme.lightBottomSheetTheme,
    elevatedButtonTheme: UNElevatedButton.lightElevatedButtonTheme,
    outlinedButtonTheme: UNOutlinedButtonTheme.lightOutlinedButtonTheme,
    inputDecorationTheme: UNTextFormFieldTheme.lightTextFieldTheme,
  );
  static ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    fontFamily: 'Poppins',
    brightness: Brightness.dark,
    primaryColor: Colors.lightGreen,
    scaffoldBackgroundColor: Colors.black,
    textTheme: UNTextTheme.darkTextTheme,
    chipTheme: UNChipTheme.darkChipTheme,
    appBarTheme: UNAppBarTheme.darkAppBarTheme,
    checkboxTheme: UNCheckBoxTheme.darkCheckBoxTheme,
    bottomSheetTheme: UNBottomSheetTheme.darkBottomSheetTheme,
    elevatedButtonTheme: UNElevatedButton.darkElevatedButtonTheme,
    outlinedButtonTheme: UNOutlinedButtonTheme.darkOutlinedButtonTheme,
    inputDecorationTheme: UNTextFormFieldTheme.darkTextFieldTheme,
  );
}
