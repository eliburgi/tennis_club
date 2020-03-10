import 'package:flutter/material.dart';

class EmailFormField extends StatefulWidget {
  @override
  _EmailFormFieldState createState() => _EmailFormFieldState();
}

class _EmailFormFieldState extends State<EmailFormField> {
  TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
    _controller.addListener(() => setState(() {}));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 32.0, vertical: 8.0),
      child: TextFormField(
        controller: _controller,
        decoration: InputDecoration(
          prefixIcon: Icon(
            Icons.email,
            color: Theme.of(context).primaryColor,
          ),
          hintText: 'Email',
        ),
      ),
    );
  }
}
