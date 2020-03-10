import 'package:flutter/material.dart';
import 'package:tennis_club/features/auth/pages/login/widgets/email_field.dart';
import 'package:tennis_club/features/auth/pages/login/widgets/login_form.dart';
import 'package:tennis_club/features/auth/pages/login/widgets/password_field.dart';

class LoginPageLayoutMobile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: SafeArea(
        top: true,
        child: Center(
          child: LoginForm(),
        ),
      ),
    );
  }
}
