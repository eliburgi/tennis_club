import 'package:flutter/material.dart';
import 'colors.dart';
import 'buttons.dart';
import 'text.dart';
import 'inputs.dart';

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

      // BUTTONS
      buttonTheme: ButtonThemes.normal,
    );
