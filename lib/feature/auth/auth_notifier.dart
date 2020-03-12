import 'package:flutter/material.dart';
import 'package:tennis_club/feature/auth/login/login_usecase.dart';
import 'package:tennis_club/feature/auth/logout/logout_usecase.dart';

import 'user.dart';

/// Represents a [User] session, i.e. keeps track of a currently logged in user.
class AuthNotifier with ChangeNotifier {
  AuthNotifier({
    @required this.loginUseCase,
    @required this.logoutUseCase,
  })  : assert(loginUseCase != null),
        assert(logoutUseCase != null);

  final LoginUseCase loginUseCase;
  final LogoutUseCase logoutUseCase;

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

  /// Logs out the [user].
  ///
  /// Short-circuits if no [User] is currently logged in.
  ///
  /// See [LogoutUseCase.logout] for possible thrown failures.
  Future logout() async {
    if (state != AuthState.loggedIn) return;

    try {
      await logoutUseCase.logout();
      _user = null;
      _setState(AuthState.loggedOut);
    } catch (failure) {
      throw failure;
    }
  }

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
