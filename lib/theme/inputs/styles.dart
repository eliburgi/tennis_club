import 'package:flutter/material.dart';
import '../colors.dart';
import '../text/styles.dart';

abstract class InputColors {
  static const cursor = AppColors.primaryDark2;
  static const textSelectionHandle = AppColors.primaryDark2;
}

abstract class InputTextThemes {
  // The Flutter [TextField] uses the [TextTheme.subtitle1] style by default
  // for its text.
  static final TextTheme hint = TextThemes.onPrimaryDark.merge(
    TextTheme(
      subtitle1: TextThemes.onPrimaryDark.subtitle2,
    ),
  );

  static final TextTheme body = TextThemes.onPrimaryDark.merge(
    TextTheme(
      subtitle1: TextThemes.onPrimaryDark2.subtitle2,
    ),
  );
}

abstract class InputDecorationThemes {
  static final normal = InputDecorationTheme(
    filled: true,
    fillColor: AppColors.primaryDark,
    border: OutlineInputBorder(borderSide: BorderSide.none),
    hintStyle: InputTextThemes.hint.subtitle1,
  );
}
