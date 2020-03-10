import 'package:flutter/material.dart';
import 'colors.dart';
import 'text/styles.dart';
import 'input/styles.dart';

ThemeData buildTheme() => ThemeData.light().copyWith(
      // COLORS
      primaryColor: AppColors.primary,
      primaryColorLight: AppColors.primaryLight,
      primaryColorDark: AppColors.primaryDark,
      primaryColorBrightness: AppColors.primaryBrightness,
      accentColor: AppColors.accent,
      accentColorBrightness: AppColors.accentBrightness,

      // TEXT
      textTheme: TextThemes.normal,
      primaryTextTheme: TextThemes.onPrimary,

      // TEXT-FIELDS
      inputDecorationTheme: InputDecorationThemes.normal,
      cursorColor: InputColors.cursor,
      textSelectionHandleColor: InputColors.textSelectionHandle,
    );
