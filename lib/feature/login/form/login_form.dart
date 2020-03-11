import 'package:flutter/material.dart';
import 'package:tennis_club/feature/login/form/login_button.dart';
import 'package:tennis_club/widget/margin.dart';

import 'email_field.dart';
import 'password_field.dart';

class LoginForm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(32.0),
      child: Form(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            EmailFormField(),
            Margin.vertical(12.0),
            PasswordFormField(),
            Margin.vertical(24.0),
            LoginButton(),
          ],
        ),
      ),
    );
  }
}
