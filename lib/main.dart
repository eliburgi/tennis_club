import 'package:flutter/material.dart';
import 'package:tennis_club/pages/home/index.dart';

void main() => runApp(TennisClubApp());

class TennisClubApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tennis Club',
      home: HomePage(),
    );
  }
}
