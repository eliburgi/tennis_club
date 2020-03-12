import 'package:flutter/material.dart';

class PasswordFormField extends StatelessWidget {
  PasswordFormField({@required this.controller}) : assert(controller != null);

  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      obscureText: true,
      decoration: InputDecoration(
        prefixIcon: Icon(Icons.lock, color: Theme.of(context).iconTheme.color),
        hintText: 'Password',
      ),
    );
  }
}
