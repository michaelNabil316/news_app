import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hexcolor/hexcolor.dart';

final customLightThemeData = ThemeData(
  primaryColor: Colors.orange,
  scaffoldBackgroundColor: Colors.white,
  appBarTheme: const AppBarTheme(
    iconTheme: IconThemeData(color: Colors.black),
    titleTextStyle: TextStyle(
        color: Colors.black, fontSize: 20.0, fontWeight: FontWeight.bold),
    backgroundColor: Colors.white,
    elevation: 0.0,
    systemOverlayStyle: SystemUiOverlayStyle(
      statusBarColor: Colors.white,
      statusBarIconBrightness: Brightness.dark,
    ),
    actionsIconTheme: IconThemeData(color: Colors.black),
  ),
  bottomNavigationBarTheme: const BottomNavigationBarThemeData(
    backgroundColor: Colors.white,
    selectedItemColor: Colors.orange,
    unselectedItemColor: Colors.black54,
    elevation: 0.0,
  ),
  textTheme: const TextTheme(
    bodyText1: TextStyle(
      fontSize: 18.0,
      color: Colors.black,
      overflow: TextOverflow.ellipsis,
    ),
    bodyText2: TextStyle(
      fontSize: 14.0,
      color: Colors.black,
      overflow: TextOverflow.ellipsis,
    ),
  ),
);
//------------------- for dark mode --------------------
final customDarkThemeData = ThemeData(
  primaryColor: Colors.orange,
  scaffoldBackgroundColor: HexColor('#5b5b5b'),
  appBarTheme: AppBarTheme(
    iconTheme: const IconThemeData(color: Colors.white),
    titleTextStyle: const TextStyle(
      color: Colors.white,
      fontSize: 20.0,
      fontWeight: FontWeight.bold,
    ),
    backgroundColor: HexColor('#5b5b5b'),
    elevation: 0.0,
    systemOverlayStyle: const SystemUiOverlayStyle(
      statusBarColor: Colors.black45,
      statusBarIconBrightness: Brightness.light,
    ),
    actionsIconTheme: const IconThemeData(color: Colors.white),
  ),
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
    backgroundColor: HexColor('#5b5b5b'),
    selectedItemColor: Colors.orange,
    unselectedItemColor: Colors.white,
    elevation: 0.0,
  ),
  textTheme: const TextTheme(
    bodyText1: TextStyle(
      fontSize: 18.0,
      color: Colors.white,
      overflow: TextOverflow.ellipsis,
    ),
    bodyText2: TextStyle(
      fontSize: 14.0,
      color: Colors.white,
      overflow: TextOverflow.ellipsis,
    ),
  ),
);
