import 'package:flutter/material.dart';
import 'package:tennis_club/theme/inputs/styles.dart';
import 'package:tennis_club/theme/text/styles.dart';

import 'email_field.dart';
import 'password_field.dart';

class LoginForm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    // The primary color is used for the email and password icons.
    // The subtitle1 text style is used for the email and password text.
    return Theme(
      data: theme.copyWith(
        primaryColor: TextColors.onPrimaryDark,
        textTheme: InputTextThemes.body,
      ),
      child: Form(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            EmailFormField(),
            PasswordFormField(),
          ],
        ),
      ),
    );
  }
}
