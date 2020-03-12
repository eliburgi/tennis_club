import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoginButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(8.0),
      child: FlatButton(
        padding: const EdgeInsets.all(16.0),
        color: Theme.of(context).primaryColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(100.0),
        ),
        textTheme: ButtonTextTheme.primary,
        onPressed: () {},
        child: Text(
          'Sign In',
        ),
      ),
    );
  }
}
