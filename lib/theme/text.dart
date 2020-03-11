import 'package:flutter/material.dart';
import 'colors.dart';

abstract class TextColors {
  // text that contrasts with the normal background color (e.g. white)
  static const normal = Colors.black;

  // text that contrasts with the primary color scheme (from lightest to darkest)
  static const onPrimary = AppColors.primaryDark;
  static const onPrimaryDark = AppColors.primaryDark2;
  static const onPrimaryDark2 = AppColors.primaryDark3;
}

abstract class TextStyles {
  static const subtitle1 = TextStyle(
    fontFamily: 'Raleway',
    fontSize: 16.0,
    color: TextColors.normal,
  );

  static const subtitle2 = TextStyle(
    fontFamily: 'Raleway',
    fontSize: 14.0,
    fontWeight: FontWeight.bold,
    color: TextColors.normal,
  );

  static const button = TextStyle(
    fontFamily: 'Raleway',
    fontSize: 14.0,
    fontWeight: FontWeight.bold,
    color: TextColors.normal,
  );
}

abstract class TextThemes {
  static const normal = TextTheme(
    subtitle1: TextStyles.subtitle1,
    subtitle2: TextStyles.subtitle2,
    button: TextStyles.button,
  );

  static final onPrimary = normal.merge(
    TextTheme(
      subtitle1: TextStyle(color: TextColors.onPrimary),
      subtitle2: TextStyle(color: TextColors.onPrimary),
      button: TextStyle(color: TextColors.onPrimary),
    ),
  );

  static final onPrimaryDark = normal.merge(
    TextTheme(
      subtitle1: TextStyle(color: TextColors.onPrimaryDark),
      subtitle2: TextStyle(color: TextColors.onPrimaryDark),
      button: TextStyle(color: TextColors.onPrimaryDark),
    ),
  );

  static final onPrimaryDark2 = normal.merge(
    TextTheme(
      subtitle1: TextStyle(color: TextColors.onPrimaryDark2),
      subtitle2: TextStyle(color: TextColors.onPrimaryDark2),
      button: TextStyle(color: TextColors.onPrimaryDark2),
    ),
  );
}
