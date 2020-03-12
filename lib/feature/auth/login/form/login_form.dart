import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tennis_club/widget/margin.dart';

import '../login_notifier.dart';
import 'email_field.dart';
import 'password_field.dart';
import 'login_button.dart';

class LoginForm extends StatefulWidget {
  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final _formKey = GlobalKey<FormState>();

  void _onSubmit() {
    _formKey.currentState.validate();
  }

  @override
  Widget build(BuildContext context) {
    final loginNotifier = Provider.of<LoginNotifier>(context);

    return Padding(
      padding: const EdgeInsets.all(32.0),
      child: Form(
        key: _formKey,
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
