import 'package:flutter/material.dart';

class PasswordFormField extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 32.0, vertical: 8.0),
      child: TextFormField(
        obscureText: true,
        decoration: InputDecoration(
          prefixIcon: Icon(
            Icons.lock,
            color: Theme.of(context).primaryColor,
          ),
          hintText: 'Password',
        ),
      ),
    );
  }
}
