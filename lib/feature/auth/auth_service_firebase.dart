import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:tennis_club/feature/auth/auth_failures.dart';

import 'auth_service.dart';

class FirebaseAuthService implements AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  Future<User> login(String email, String password) async {
    try {
      AuthResult authResult = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return User(
        id: authResult.user.uid,
        name: authResult.user.displayName ?? 'no_username_set',
      );
    } on AuthException catch (aErr) {
      switch (aErr.code) {
        case 'ERROR_INVALID_EMAIL':
          throw InvalidEmailFailure();
        case 'ERROR_WRONG_PASSWORD':
          throw WrongPasswordFailure();
        case 'ERROR_USER_NOT_FOUND':
          throw AccountNotFoundFailure();
        default:
          throw UnknownAuthFailure(aErr.code);
      }
    } on PlatformException catch (pErr) {
      switch (pErr.code) {
        case 'ERROR_INVALID_EMAIL':
          throw InvalidEmailFailure();
        case 'ERROR_WRONG_PASSWORD':
          throw WrongPasswordFailure();
        case 'ERROR_USER_NOT_FOUND':
          throw AccountNotFoundFailure();
        case 'ERROR_NETWORK_REQUEST_FAILED':
          throw NoInternetFailure();
        default:
          throw UnknownAuthFailure(pErr.code);
      }
    }
  }

  @override
  Future logout() {
    return _auth.signOut();
  }
}
