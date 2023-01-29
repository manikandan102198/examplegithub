import 'package:flutter/material.dart';

import 'app_color.dart';

final themeData = ThemeData(
  fontFamily: 'Inter',
  appBarTheme: const AppBarTheme(
      iconTheme: IconThemeData(color: Colors.black),
      titleTextStyle: TextStyle(
          color: Colors.black, fontSize: 16, fontWeight: FontWeight.w600),
      backgroundColor: AppColor.backgroundColor,
      elevation: 0),
  scaffoldBackgroundColor: AppColor.backgroundColor,
  primarySwatch: AppColor.lightBlueColor,
  dividerColor: Colors.grey.withOpacity(0.5),
  backgroundColor: AppColor.backgroundColor,
  primaryTextTheme: TextTheme(
    button: TextStyle(
      color: Colors.blueGrey,
      decorationColor: Colors.blueGrey[300],
    ),
    headline1: const TextStyle(
        color: Colors.white, fontSize: 14, fontWeight: FontWeight.w400),
    headline2: const TextStyle(
        color: Colors.black, fontSize: 14, fontWeight: FontWeight.w400),
    headline3: const TextStyle(
        color: AppColor.shaderGrey, fontSize: 15, fontWeight: FontWeight.w500),
    headline4: const TextStyle(
        color: Colors.black, fontSize: 13, fontWeight: FontWeight.w400),
    headline5: const TextStyle(
        color: Colors.black, fontSize: 15, fontWeight: FontWeight.w500),
    headline6: const TextStyle(
        color: AppColor.shaderGrey, fontSize: 12, fontWeight: FontWeight.w400),
    labelMedium: const TextStyle(
        color: Colors.black, fontSize: 12, fontWeight: FontWeight.w400),
    headlineLarge: const TextStyle(
        color: Colors.black, fontSize: 16, fontWeight: FontWeight.w600),
    subtitle1: const TextStyle(
        color: Colors.black, fontSize: 12, fontWeight: FontWeight.w300),
    subtitle2: const TextStyle(
        color: AppColor.lightBlueColor,
        fontSize: 12,
        fontWeight: FontWeight.w300,
        decoration: TextDecoration.underline),
    bodyText1: const TextStyle(
        color: Colors.black, fontSize: 14, fontWeight: FontWeight.w600),
    bodyText2: const TextStyle(
        color: Colors.black, fontSize: 14, fontWeight: FontWeight.w400),
  ),
  iconTheme: const IconThemeData(color: Colors.grey),
  brightness: Brightness.light,
);
