import 'package:flutter/material.dart';
import 'package:tennis_club/feature/auth/auth_failures.dart';

class LoginFailureText extends StatelessWidget {
  LoginFailureText({
    @required this.failure,
  }) : assert(failure != null);

  final AuthFailure failure;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Text(
      failure.toString(),
      style: theme.textTheme.caption.copyWith(
        color: theme.errorColor,
      ),
      textAlign: TextAlign.center,
    );
  }
}
