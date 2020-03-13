import 'package:flutter/material.dart';

ThemeData buildTheme() => ThemeData.light().copyWith(
      // COLORS
      primaryColor: AppColors.primary,
      primaryColorLight: AppColors.primaryLight,
      primaryColorDark: AppColors.primaryDark,
      primaryColorBrightness: AppColors.primaryBrightness,
      accentColor: AppColors.accent,
      accentColorBrightness: AppColors.accentBrightness,
      scaffoldBackgroundColor: AppColors.scaffoldBackground,

      // TEXT
      textTheme: TextThemes.normal,
      primaryTextTheme: TextThemes.onPrimary,

      // TEXT-FIELDS
      inputDecorationTheme: InputDecorationThemes.normal,
      cursorColor: InputColors.cursor,
      textSelectionHandleColor: InputColors.textSelectionHandle,

      // ICONS
      iconTheme: IconThemes.normal,
    );

abstract class AppColors {
  static const primary = Color(0xFFF8567A);
  static const primaryLight = primary;
  static const primaryDark = primary;
  static const primaryBrightness = Brightness.dark;

  static const accent = Colors.white;
  static const accentBrightness = Brightness.light;

  static const scaffoldBackground = Color(0xFFFCFCFC);
  static const error = primary;
}

abstract class TextColors {
  /// For text that contrasts well with the normal background color.
  /// From high to low contrast, i.e. normal1 has the highest contrast.
  static const normal1 = Color(0xFF393939);
  static final normal2 = normal1.withOpacity(0.5);

  /// For text that contrasts well with the primary color.
  /// From high to low contrast, i.e. onPrimary1 has the highest contrast.
  static const onPrimary1 = Colors.white;
  static final onPrimary2 = onPrimary1.withOpacity(0.5);
}

abstract class TextThemes {
  static final normal = TextTheme(
    headline3: TextStyle(
      fontFamily: 'Bluefish Demo',
      fontSize: 45.0,
      fontWeight: FontWeight.bold,
      color: TextColors.normal1,
    ),
    headline6: TextStyle(
      fontFamily: 'Bluefish Demo',
      fontSize: 20.0,
      fontWeight: FontWeight.bold,
      color: TextColors.normal1,
    ),
    subtitle1: TextStyle(
      fontFamily: 'Raleway',
      fontSize: 14.0,
      fontWeight: FontWeight.bold,
      color: TextColors.normal1,
    ),
    subtitle2: TextStyle(
      fontFamily: 'Raleway',
      fontSize: 14.0,
      fontWeight: FontWeight.bold,
      color: TextColors.normal1,
    ),
    button: TextStyle(
      fontFamily: 'Raleway',
      fontSize: 14.0,
      fontWeight: FontWeight.bold,
      color: TextColors.normal1,
    ),
    caption: TextStyle(
      fontFamily: 'Raleway',
      fontSize: 12.0,
      fontWeight: FontWeight.bold,
      color: TextColors.normal1,
    ),
  );

  static final onPrimary = normal.merge(
    TextTheme(
      headline3: TextStyle(color: TextColors.onPrimary1),
      headline6: TextStyle(color: TextColors.onPrimary1),
      subtitle1: TextStyle(color: TextColors.onPrimary1),
      subtitle2: TextStyle(color: TextColors.onPrimary1),
      button: TextStyle(color: TextColors.onPrimary1),
    ),
  );
}

abstract class InputColors {
  static final cursor = TextColors.normal1;
  static final textSelectionHandle = TextColors.normal1;
}

abstract class InputDecorationThemes {
  static final normal = InputDecorationTheme(
    filled: true,
    fillColor: Colors.black.withOpacity(0.05),
    border: OutlineInputBorder(borderSide: BorderSide.none),
    errorStyle: TextThemes.normal.caption.copyWith(
      color: AppColors.error,
    ),
  );
}

abstract class IconThemes {
  static final normal = IconThemeData(
    color: TextColors.normal2,
  );
}
