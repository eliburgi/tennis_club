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
  TextEditingController _emailController;
  TextEditingController _passwordController;

  @override
  void initState() {
    super.initState();
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _onLoginButtonPressed() {
    String email = _emailController.value.text;
    String password = _passwordController.value.text;
    Provider.of<LoginNotifier>(context, listen: false).login(email, password);
  }

  @override
  Widget build(BuildContext context) {
    LoginNotifier loginNotifier = Provider.of(context);
    ThemeData theme = Theme.of(context);

    return Padding(
      padding: const EdgeInsets.all(32.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          EmailFormField(controller: _emailController),
          Margin.vertical(12.0),
          PasswordFormField(controller: _passwordController),
          if (loginNotifier.hasFailure) ...[
            Margin.vertical(12.0),
            Text(
              loginNotifier.failure.toString(),
              style: theme.textTheme.caption.copyWith(
                color: theme.primaryColor,
              ),
            ),
          ],
          Margin.vertical(24.0),
          LoginButton(onTap: _onLoginButtonPressed),
        ],
      ),
    );
  }
}
