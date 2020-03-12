import 'package:flutter/material.dart';
import 'package:tennis_club/feature/auth/login/login_usecase.dart';

import 'user.dart';

/// Represents a [User] session, i.e. keeps track of a currently logged in user.
class AuthNotifier with ChangeNotifier {
  AuthNotifier(this.loginUseCase);

  final LoginUseCase loginUseCase;

  /// Initially set to [AuthState.loggedOut].
  AuthState get state => _state;
  AuthState _state = AuthState.loggedOut;

  /// The [User] that is currently logged in.
  ///
  /// Will be `null` if [state] is not [AuthState.loggedIn].
  User get user => _user;
  User _user;

  /// Logs in the [User] with the given [email].
  ///
  /// Short-circuits if a [User] is currently logged in or logging in.
  ///
  /// See [LoginUseCase.login] for possible thrown failures.
  Future login(String email, String password) async {
    if (state != AuthState.loggedOut) return;

    _setState(AuthState.loggingIn);
    try {
      _user = await loginUseCase.login(email, password);
      _setState(AuthState.loggedIn);
    } catch (failure) {
      _user = null;
      _setState(AuthState.loggedOut);
      throw failure;
    }
  }

  void logout() {}

  void _setState(AuthState state) {
    _state = state;
    notifyListeners();
  }
}

enum AuthState {
  loggedOut,
  loggingIn,
  loggedIn,
}
