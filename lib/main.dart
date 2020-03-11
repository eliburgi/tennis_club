import 'package:flutter/material.dart';
import 'package:tennis_club/theme.dart';

import 'package:tennis_club/feature/login/login_page.dart';

void main() => runApp(TennisClubApp());

class TennisClubApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tennis Club',
      theme: buildTheme(),
      home: LoginPage(),
    );
  }
}
