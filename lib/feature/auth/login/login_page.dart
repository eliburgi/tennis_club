import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tennis_club/feature/auth/login/app_logo.dart';
import 'package:tennis_club/feature/auth/login/login_notifier.dart';
import '../auth_notifier.dart';
import 'form/login_form.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<LoginNotifier>(
      create: (context) => LoginNotifier(
        Provider.of<AuthNotifier>(context, listen: false),
      ),
      child: Scaffold(
        body: SafeArea(
          top: true,
          child: Stack(
            children: <Widget>[
              Align(
                alignment: Alignment(0, -0.7),
                child: AppLogo(),
              ),
              Center(child: LoginForm()),
            ],
          ),
        ),
      ),
    );
  }
}
