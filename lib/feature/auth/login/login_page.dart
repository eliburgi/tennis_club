import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tennis_club/feature/auth/login/login_notifier.dart';
import '../auth_notifier.dart';
import 'form/login_form.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => LoginNotifier(Provider.of<AuthNotifier>(context)),
      child: Scaffold(
        body: SafeArea(
          top: true,
          child: Center(
            child: LoginForm(),
          ),
        ),
      ),
    );
  }
}
