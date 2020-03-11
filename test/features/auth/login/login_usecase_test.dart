@TestOn('vm')
import 'package:mockito/mockito.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:tennis_club/feature/auth/auth_service.dart';
import 'package:tennis_club/feature/auth/login/login_usecase.dart';

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
    test('invalid email', () {
      final invalidEmail = 'invalid-email-adr';
      final pw = 'password';

      expect(
        () => usecase.loginWithEmail(invalidEmail, pw),
        throwsA(isInstanceOf<InvalidEmailException>()),
      );
      verifyNever(authService.login(any, any));
    });

    test('account does not exist', () async {
      final notRegisteredEmail = 'not.found@test.com';
      final pw = 'password';

      when(authService.login(any, any))
          .thenAnswer((_) => throw AuthServiceException.accountNotFound);

      expect(
        () => usecase.loginWithEmail(notRegisteredEmail, pw),
        throwsA(isInstanceOf<AccountNotFoundException>()),
      );
      verify(authService.login(any, any)).called(1);
    });

    test('correct email but wrong password', () async {
      final email = 'user@mail.com';
      final wrongPw = 'wrongPassword';

      when(authService.login(any, any))
          .thenAnswer((_) => throw AuthServiceException.wrongPassword);

      expect(
        () => usecase.loginWithEmail(email, wrongPw),
        throwsA(isInstanceOf<WrongPasswordException>()),
      );
      verify(authService.login(any, any)).called(1);
    });

    test('correct email & password', () async {
      final user = User(id: 'ID', name: 'User');
      final email = 'user@mail.com';
      final pw = 'password';
      when(authService.login(any, any)).thenAnswer((_) async => user);

      expect(await authService.login(email, pw), user);
      verify(authService.login(any, any)).called(1);
    });
  });
}

class MockAuthService extends Mock implements AuthService {}
