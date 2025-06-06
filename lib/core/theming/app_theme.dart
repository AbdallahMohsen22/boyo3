import 'package:boyo3_v1/core/theming/colors.dart';
import 'package:flutter/material.dart';

ThemeData appTheme() {
  return ThemeData(
    useMaterial3: true,
    primaryColor: ColorsManager.mainRed,
    hintColor: ColorsManager.hint,
    brightness: Brightness.light,
    scaffoldBackgroundColor: Colors.white,
    primaryTextTheme: const TextTheme(
      displayLarge: TextStyle(
          fontSize: 28, color: Colors.black, fontWeight: FontWeight.w900),
      displayMedium: TextStyle(
          fontSize: 24, color: Colors.black, fontWeight: FontWeight.w900),
      displaySmall: TextStyle(
          fontSize: 20, color: Colors.black, fontWeight: FontWeight.w700),
      headlineMedium: TextStyle(
          fontSize: 18, color: Colors.black, fontWeight: FontWeight.w700),
      headlineSmall: TextStyle(
          fontSize: 16, color: Colors.black, fontWeight: FontWeight.w700),
      titleLarge: TextStyle(
        fontSize: 14,
        color: Colors.black,
      ),
      titleMedium: TextStyle(
        fontSize: 16,
        color: Colors.black,
      ),
      titleSmall: TextStyle(
        fontSize: 16,
        color: Colors.black,
      ),
      bodyLarge: TextStyle(
        fontSize: 16,
        color: Colors.black,
      ),
      bodyMedium: TextStyle(
        fontSize: 14,
        color: Colors.black,
      ),
      labelLarge: TextStyle(
          fontSize: 20, color: Colors.black, fontWeight: FontWeight.w700),
    ),

    fontFamily: "Tajawal",
    textTheme: const TextTheme(
      bodyMedium: TextStyle(
          height: 1.3,
          fontSize: 22,
          fontFamily: "Tajawal",
          color: Colors.black,
          fontWeight: FontWeight.bold),
    ),
    appBarTheme: const AppBarTheme(
        centerTitle: false,
        color: Colors.transparent,
        elevation: 0,
        iconTheme: IconThemeData(
          color: Colors.black,
        ),
        titleTextStyle: TextStyle(
            fontFamily: "Tajawal",
            color: ColorsManager.mainRed,
            fontSize: 20,
            fontWeight: FontWeight.w500)),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        backgroundColor: ColorsManager.lightScaffoldBackgroundColor,
        elevation: 0,
        selectedIconTheme: IconThemeData(
          color: ColorsManager.mainRed,
        ),
        unselectedIconTheme: IconThemeData(
          color: Colors.black,
        ),
        selectedItemColor: ColorsManager.mainRed,
        unselectedItemColor: Colors.black),

    //fontFamily: 'jannah',
  );
}
