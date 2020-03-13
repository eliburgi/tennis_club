import 'package:flutter/material.dart';

class ForgotPasswordButton extends StatelessWidget {
  ForgotPasswordButton({
    @required this.onTap,
  }) : assert(onTap != null);

  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Text(
          'Forgot Password?',
          style: theme.textTheme.caption,
          textAlign: TextAlign.end,
        ),
      ),
    );
  }
}
