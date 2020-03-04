@TestOn('vm')

import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:tennis_club/features/auth/models/user.dart';
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
        expect(e.code, LoginExceptionCode.invalidPassword);
      }
      verifyNever(authService.loginWithEmail(any, any));
    });

    test('account does not exist', () async {
      when(authService.loginWithEmail(any, any))
          .thenAnswer((_) => throw AuthException.accountDoesNotExist);

      final email = 'user@mail.com';
      final pw = 'password';

      try {
        await usecase.loginWithEmail(email, pw);
      } on LoginException catch (e) {
        expect(e.code, LoginExceptionCode.accountDoesNotExist);
      }
      verify(authService.loginWithEmail(any, any)).called(1);
    });

    test('correct email but wrong password', () async {
      when(authService.loginWithEmail(any, any))
          .thenAnswer((_) => throw AuthException.wrongPassword);

      final email = 'user@mail.com';
      final wrongPw = 'wrongPassword';

      try {
        await usecase.loginWithEmail(email, wrongPw);
      } on LoginException catch (e) {
        expect(e.code, LoginExceptionCode.wrongPassword);
      }
      verify(authService.loginWithEmail(any, any)).called(1);
    });

    test('correct email & password', () async {
      final user = User(id: 'ID', name: 'User');
      final email = 'user@mail.com';
      final pw = 'password';
      when(authService.loginWithEmail(any, any)).thenAnswer((_) async => user);

      expect(await authService.loginWithEmail(email, pw), user);
      verify(authService.loginWithEmail(any, any)).called(1);
    });
  });
}

class MockAuthService extends Mock implements AuthService {}
