import 'package:flutter/material.dart';
import 'package:flutter_screen_scaler/flutter_screen_scaler.dart';
import 'constants.dart';



ThemeData buildThemeData() {

  ScreenScaler scale = ScreenScaler();
  OutlineInputBorder inputBorder = OutlineInputBorder(
    borderRadius: BorderRadius.circular(30),
    borderSide: const BorderSide(color: Colors.transparent),
  );

  return ThemeData(

    scaffoldBackgroundColor: backgroundColor,
    primaryColor: primaryColor,
    accentColor: accentColor,
    dividerTheme: const DividerThemeData(thickness: 1, space: 30),

    fontFamily: 'Rubik',
    textTheme: TextTheme(
      button: TextStyle(fontSize: scale.getFullScreen(7), fontWeight: FontWeight.w400),
    ),

    buttonTheme: ButtonThemeData(
      padding: EdgeInsets.symmetric(vertical: scale.getFullScreen(6.5)),
      shape: const StadiumBorder(),
      textTheme: ButtonTextTheme.accent,
    ),

    cursorColor: primaryColor,
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: accentColor,
      focusedBorder: inputBorder,
      enabledBorder: inputBorder,
      contentPadding: EdgeInsets.symmetric(horizontal: 30, vertical: scale.getFullScreen(7)),
    ),
  );
}


