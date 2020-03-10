import 'package:flutter/material.dart';
import 'form/login_form.dart';

class LoginPageMobile extends StatelessWidget {
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
