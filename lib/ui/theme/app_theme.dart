import 'package:flutter/material.dart';

ThemeData lightTheme(ThemeData themeData) {
  ColorScheme colorScheme = themeData.colorScheme.copyWith(secondary: Colors.purple);
  return themeData.copyWith(
      appBarTheme: lightAppBarTheme(themeData),
      inputDecorationTheme: appInputDecorationTheme(themeData),
      colorScheme: colorScheme);
}

ThemeData darkTheme(ThemeData themeData) {
  ColorScheme colorScheme = themeData.colorScheme.copyWith(secondary: Colors.purple);
  return themeData.copyWith(
      appBarTheme: darkAppBarTheme(themeData),
      inputDecorationTheme: appInputDecorationTheme(themeData),
      colorScheme: colorScheme);
}

//  Appbar
AppBarTheme lightAppBarTheme(ThemeData themeData) {
  return themeData.appBarTheme.copyWith(
      elevation: 0,
      backgroundColor: Colors.transparent,
      foregroundColor: Colors.black,
      iconTheme: themeData.iconTheme.copyWith(color: Colors.black));
}

AppBarTheme darkAppBarTheme(ThemeData themeData) {
  return themeData.appBarTheme.copyWith(
      elevation: 0,
      backgroundColor: Colors.transparent,
      foregroundColor: Colors.white,
      iconTheme: themeData.iconTheme.copyWith(color: Colors.white));
}

// InputDecorator

InputDecorationTheme appInputDecorationTheme(ThemeData themeData) {
  return themeData.inputDecorationTheme.copyWith(
      isDense: true,
      focusedBorder: const OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(8.0)),
        borderSide: BorderSide(color: Colors.grey, width: 0.5),
      ),
      enabledBorder: const OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(8.0)),
        borderSide: BorderSide(color: Colors.grey, width: 0.5),
      ),
      disabledBorder: const OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(8.0)),
        borderSide: BorderSide(color: Colors.grey, width: 0.5),
      ),
      focusedErrorBorder: const OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(8.0)),
        borderSide: BorderSide(color: Colors.red, width: 0.5),
      ),
      errorBorder: const OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(8.0)),
        borderSide: BorderSide(color: Colors.red, width: 0.5),
      ));
}
