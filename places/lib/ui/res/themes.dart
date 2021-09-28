import 'package:flutter/material.dart';

final sLightTheme = ThemeData(
  secondaryHeaderColor: Colors.black,
  canvasColor: const Color(0xff252849),
  focusColor: Colors.white,
  primaryColor: Colors.white,
  primaryColorLight: const Color(0xFFF5F5F5),
  primaryColorDark: const Color(0xff3B3E5B),
  scaffoldBackgroundColor: Colors.white,
  appBarTheme: const AppBarTheme(
    backgroundColor: Colors.white,
    // brightness: Brightness.light,
    elevation: 0,
    toolbarHeight: 0,
  ),
  textTheme: const TextTheme(
    headline1: TextStyle(
      height: 1.25,
      fontWeight: FontWeight.w500,
      fontSize: 16,
      color: Color(0xFF3B3E5B),
    ),
    headline2: TextStyle(
      height: 1.35,
      fontSize: 14,
      color: Color(0xff7C7E92),
    ),
    headline3: TextStyle(
      fontSize: 30,
      color: Color(0xff262847),
      fontWeight: FontWeight.w700,
    ),
    headline4: TextStyle(
      fontSize: 30,
      color: Color(0xff67ad5b),
      fontWeight: FontWeight.w700,
    ),
    headline5: TextStyle(
      fontSize: 30,
      color: Color(0xfff7de5e),
      fontWeight: FontWeight.w700,
    ),
    headline6: TextStyle(
      fontSize: 14,
      color: Color(0xff4CAF50),
      fontWeight: FontWeight.w400,
    ),
    subtitle1: TextStyle(
      fontSize: 24,
      fontWeight: FontWeight.w700,
      color: Color(0xff3B3E5B),
      height: 1.2,
    ),
    subtitle2: TextStyle(
      fontWeight: FontWeight.w700,
      fontSize: 14,
      color: Color(0xff3B3E5B),
      height: 1.3,
    ),
    bodyText1: TextStyle(
      fontWeight: FontWeight.w400,
      fontSize: 14,
      color: Color(0xff3B3E5B),
      height: 1.3,
    ),
  ),
  bottomNavigationBarTheme: const BottomNavigationBarThemeData(
    backgroundColor: Colors.white,
    elevation: 10,
    showSelectedLabels: false,
    showUnselectedLabels: false,
    selectedIconTheme: IconThemeData(
      size: 26,
      color: Colors.black,
    ),
    unselectedIconTheme: IconThemeData(
      size: 26,
      color: Colors.grey,
    ),
  ),
  textButtonTheme: TextButtonThemeData(
    style: OutlinedButton.styleFrom(
      padding: EdgeInsets.zero,
    ),
  ),
  bottomSheetTheme: const BottomSheetThemeData(
    backgroundColor: Colors.transparent,
  ),
);

final sDarkTheme = ThemeData(
  secondaryHeaderColor: Colors.white,
  canvasColor: const Color(0xffffffff),
  focusColor: const Color(0xff3B3E5B),
  primaryColor: const Color(0xff21222C),
  primaryColorLight: const Color(0xFF1A1A20),
  primaryColorDark: const Color(0xffffffff),
  scaffoldBackgroundColor: const Color(0xff21222C),
  appBarTheme: const AppBarTheme(
    backgroundColor: Color(0xff21222C),
    // brightness: Brightness.dark,
    elevation: 0,
    toolbarHeight: 0,
  ),
  textTheme: const TextTheme(
    headline1: TextStyle(
      height: 1.25,
      fontWeight: FontWeight.w500,
      fontSize: 16,
      color: Color(0xFFFFFFFF),
    ),
    headline2: TextStyle(
      height: 1.35,
      fontSize: 14,
      color: Color(0xff7C7E92),
    ),
    headline3: TextStyle(
      fontSize: 32,
      color: Color(0xffffffff),
      fontWeight: FontWeight.w700,
    ),
    headline4: TextStyle(
      fontSize: 32,
      color: Color(0xffffffff),
      fontWeight: FontWeight.w700,
    ),
    headline5: TextStyle(
      fontSize: 32,
      color: Color(0xffffffff),
      fontWeight: FontWeight.w700,
    ),
    headline6: TextStyle(
      fontSize: 14,
      color: Color(0xff6ADA6F),
      fontWeight: FontWeight.w400,
    ),
    subtitle1: TextStyle(
      fontSize: 24,
      fontWeight: FontWeight.w700,
      color: Color(0xffffffff),
      height: 1.2,
    ),
    subtitle2: TextStyle(
      fontWeight: FontWeight.w700,
      fontSize: 14,
      color: Color(0xff7C7E92),
      height: 1.3,
    ),
    bodyText1: TextStyle(
      fontWeight: FontWeight.w400,
      fontSize: 14,
      color: Color(0xffffffff),
      height: 1.3,
    ),
  ),
  bottomNavigationBarTheme: const BottomNavigationBarThemeData(
    backgroundColor: Color(0xff21222c),
    elevation: 10,
    showSelectedLabels: false,
    showUnselectedLabels: false,
    selectedIconTheme: IconThemeData(
      size: 26,
      color: Colors.white,
    ),
    unselectedIconTheme: IconThemeData(
      size: 26,
      color: Colors.white70,
    ),
  ),
  textButtonTheme: TextButtonThemeData(
    style: OutlinedButton.styleFrom(
      padding: EdgeInsets.zero,
    ),
  ),
  bottomSheetTheme: const BottomSheetThemeData(
    backgroundColor: Colors.transparent,
  ),
);
