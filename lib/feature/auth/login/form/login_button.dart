import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../login_notifier.dart';

class LoginButton extends StatelessWidget {
  LoginButton({
    @required this.onTap,
  }) : assert(onTap != null);

  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final loginNotifier = Provider.of<LoginNotifier>(context);
    final theme = Theme.of(context);

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(8.0),
      child: FlatButton(
        padding: const EdgeInsets.all(16.0),
        color: theme.primaryColor,
        disabledColor: theme.primaryColor.withOpacity(0.8),
        disabledTextColor: theme.primaryTextTheme.button.color,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(100.0),
        ),
        textTheme: ButtonTextTheme.primary,
        onPressed: loginNotifier.loading ? null : onTap,
        child: loginNotifier.loading
            ? Stack(
                children: <Widget>[
                  Center(child: Text('Sign In')),
                  Align(
                    alignment: Alignment.centerRight,
                    child: SizedBox.fromSize(
                      size: Size.square(16.0),
                      child: CircularProgressIndicator(
                        strokeWidth: 2.5,
                      ),
                    ),
                  ),
                ],
              )
            : Text('Sign In'),
      ),
    );
  }
}
