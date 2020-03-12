import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tennis_club/feature/auth/auth_notifier.dart';
import 'package:tennis_club/feature/auth/login/login_page.dart';
import 'package:tennis_club/feature/home/home_page.dart';
import 'package:tennis_club/injection.dart';
import 'package:tennis_club/theme.dart';

void main() => runApp(DependencyInjection(child: TennisClubApp()));

class TennisClubApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    AuthNotifier authNotifier = Provider.of(context);

    return MaterialApp(
      title: 'Tennis Club',
      theme: buildTheme(),
      home: authNotifier.state == AuthState.loggedIn ? HomePage() : LoginPage(),
    );
  }
}
