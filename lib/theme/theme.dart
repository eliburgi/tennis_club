import 'package:flutter/material.dart';

final tennisClubTheme = ThemeData.light().copyWith(
  // COLORS
  primaryColor: const Color(0xFFFF6776),
  primaryColorLight: const Color(0xFFFF6776),
  primaryColorDark: const Color(0xFFFF6776),
  primaryColorBrightness: Brightness.light,
  accentColor: const Color(0xFFFF6776),
  accentColorBrightness: Brightness.light,

  textTheme: const TextTheme(
    subtitle2: TextStyle(
      fontFamily: 'Raleway',
      fontSize: 14.0,
      fontWeight: FontWeight.bold,
      color: Colors.black,
    ),
  ),
);
