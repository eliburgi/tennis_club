import 'package:flutter/material.dart';

class EmailFormField extends StatelessWidget {
  EmailFormField({@required this.controller}) : assert(controller != null);

  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        prefixIcon: Icon(
          Icons.email,
          color: Theme.of(context).iconTheme.color,
        ),
        hintText: 'Email',
      ),
    );
  }
}
