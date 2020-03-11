import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tennis_club/widget/margin.dart';

import 'form_bloc.dart';
import 'email_field.dart';
import 'password_field.dart';
import 'login_button.dart';

class LoginForm extends StatefulWidget {
  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  @override
  Widget build(BuildContext context) {
    return Provider<FormBloc>(
      create: (context) => FormBloc(),
      child: Padding(
        padding: const EdgeInsets.all(32.0),
        child: Form(
          autovalidate: true,
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
      ),
    );
  }
}
