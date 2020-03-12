import 'package:flutter/material.dart';
import 'package:tennis_club/feature/auth/auth_failures.dart';
import 'package:tennis_club/feature/auth/auth_notifier.dart';

class LoginNotifier with ChangeNotifier {
  LoginNotifier(this.authNotifier) : assert(authNotifier != null);

  final AuthNotifier authNotifier;

  /// Whether the user is currently being logged in.
  bool get loading => _loading;
  bool _loading = false;

  /// Any failure that resulted by calling [login].
  AuthFailure get failure => _failure;
  AuthFailure _failure;

  bool get hasFailure => _failure != null;

  void login(String email, String password) async {
    try {
      _setLoading(true);
      await authNotifier.login(email, password);
      _failure = null;
    } catch (failure) {
      _failure = failure;
    } finally {
      _setLoading(false);
    }
  }

  void _setLoading(bool loading) {
    _loading = loading;
    notifyListeners();
  }
}
