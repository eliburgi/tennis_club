import 'package:flutter/material.dart';
import 'package:tennis_club/theme/buttons.dart';

class LoginButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: FlatButton(
        color: ButtonColors.onPrimary,
        onPressed: () {},
        child: Text(
          'LOGIN',
        ),
      ),
    );
  }
}
