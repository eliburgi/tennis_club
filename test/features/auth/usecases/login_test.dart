@TestOn('vm')

import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:tennis_club/features/auth/services/auth_service.dart';
import 'package:tennis_club/features/auth/usecases/login.dart';

void main() {
  AuthService authService;
  LoginUseCase usecase;
  setUpAll(() {
    authService = MockAuthService();
    usecase = LoginUseCase(authService: authService);
  });

  test('invalid constructor arguments', () {
    expect(() => LoginUseCase(authService: null), throwsAssertionError);
  });

  group('login with email - ', () {
    test('invalid email', () async {
      final invalidEmail = 'invalid-email-adr';
      final pw = 'password';

      try {
        await usecase.loginWithEmail(invalidEmail, pw);
      } on LoginException catch (e) {
        expect(e, isA<LoginException>());
        expect(e.code, LoginExceptionCode.invalidEmail);
      }
      verifyNever(authService.loginWithEmail(any, any));
    });

    test('invalid password', () async {
      final email = 'user@mail.com';
      final invalidPassword = '';

      try {
        await usecase.loginWithEmail(email, invalidPassword);
      } on LoginException catch (e) {
        expect(e, isA<LoginException>());
        expect(e.code, LoginExceptionCode.invalidPassword);
      }
      verifyNever(authService.loginWithEmail(any, any));
    });
  });
}

class MockAuthService extends Mock implements AuthService {}
