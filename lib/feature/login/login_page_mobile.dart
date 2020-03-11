import 'package:flutter/material.dart';
import 'form/login_form.dart';

class LoginPageMobile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        top: true,
        child: Center(
          child: LoginForm(),
        ),
      ),
    );
  }
}
