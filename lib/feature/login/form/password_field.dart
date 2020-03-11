import 'package:flutter/material.dart';

class PasswordFormField extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: true,
      decoration: InputDecoration(
        prefixIcon: Icon(Icons.lock, color: Theme.of(context).iconTheme.color),
        hintText: 'Password',
      ),
    );
  }
}
