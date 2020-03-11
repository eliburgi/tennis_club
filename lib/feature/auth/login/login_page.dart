import 'package:flutter/material.dart';
import 'login_page_mobile.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Currently, the app only displays nice on mobile phone devices.
    return LoginPageMobile();
  }
}
