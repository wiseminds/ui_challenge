import 'package:flutter/material.dart';

class AppTheme {
  static const fontFamily = 'Gilroy';
  static const primaryColor = Colors.white;
  static const accentColor = Color(0xffc7e6ff);
  static const primaryColorDark = Color(0xffe6ddf2);
  static final inputBorder = OutlineInputBorder(
      borderRadius: BorderRadius.circular(5),
      borderSide: BorderSide(style: BorderStyle.none));

//// App bar theme across app
  static const AppBarTheme appBarTheme = AppBarTheme(
    color: primaryColorDark,
    brightness: Brightness.dark,
    actionsIconTheme: IconThemeData(color: Colors.white),
    iconTheme: IconThemeData(color: Colors.white),
    // color: secondaryColor,
  );

  static const AppBarTheme appBarThemeDark = AppBarTheme(
    brightness: Brightness.light,
    color: primaryColorDark,
    actionsIconTheme: IconThemeData(color: Colors.white),
    iconTheme: IconThemeData(color: Colors.white),
    // color: secondaryColor,
  );

  /// bright app theme
  static final light = ThemeData(
      primaryColor: primaryColor,
      primaryColorDark: primaryColorDark,
      accentColor: accentColor,
      backgroundColor: Colors.grey[200],
      fontFamily: fontFamily,
      brightness: Brightness.light,
      appBarTheme: appBarTheme,
        visualDensity: VisualDensity.adaptivePlatformDensity,
    inputDecorationTheme: InputDecorationTheme(
        border: inputBorder,
        enabledBorder: inputBorder.copyWith(borderSide: BorderSide.none),
        disabledBorder: inputBorder,
        errorBorder: inputBorder.copyWith(
            borderRadius: BorderRadius.circular(5),
            borderSide: BorderSide(color: Colors.red, width: 0.5)),
        focusedBorder: inputBorder.copyWith(
            borderSide:
                BorderSide(color: Colors.black, style: BorderStyle.none)),
        focusedErrorBorder: inputBorder,
      ));
}
