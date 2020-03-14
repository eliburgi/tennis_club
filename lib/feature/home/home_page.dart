import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tennis_club/feature/auth/auth_notifier.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: FlatButton(
          onPressed: () {
            try {
              Provider.of<AuthNotifier>(context, listen: false).logout();
            } catch (failure) {
              print('Failure during logout process: $failure');
            }
          },
          child: Text('Sign Out'),
        ),
      ),
    );
  }
}
