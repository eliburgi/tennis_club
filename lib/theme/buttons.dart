import 'package:flutter/material.dart';
import '../colors.dart';

abstract class ButtonColors {
  static const normal = AppColors.primary;
  static const onPrimary = AppColors.primaryDark;
}

abstract class ButtonThemes {
  static final normal = ButtonThemeData(
    minWidth: 150.0,
    padding: const EdgeInsets.all(16.0),
    buttonColor: ButtonColors.normal,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(4.0),
    ),
  );

  static final onPrimary = normal.copyWith(
    buttonColor: ButtonColors.onPrimary,
  );
}
