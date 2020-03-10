import 'package:flutter/material.dart';
import 'package:tennis_club/theme/theme.dart';
import 'package:tennis_club/features/home/page/index.dart';
import 'package:tennis_club/features/auth/pages/login/index.dart';

void main() => runApp(TennisClubApp());

class TennisClubApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final userLoggedIn = false;

    return MaterialApp(
      title: 'Tennis Club',
      theme: buildTheme(),
      home: userLoggedIn ? HomePage() : LoginPage(),
    );
  }
}
