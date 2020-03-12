@TestOn('vm')
import 'package:mockito/mockito.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:tennis_club/feature/auth/auth_failures.dart';
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
    test('email is required', () {
      final invalidEmail = 'invalid-email-adr';
      final pw = 'password';

      expect(
        () => usecase.login(invalidEmail, pw),
        throwsA(isInstanceOf<InvalidEmailFailure>()),
      );
      verifyNever(authService.login(any, any));
    });

    test('account does not exist', () async {
      final notRegisteredEmail = 'not.found@test.com';
      final pw = 'password';

      when(authService.login(any, any))
          .thenAnswer((_) => throw AccountNotFoundFailure);

      expect(
        () => usecase.login(notRegisteredEmail, pw),
        throwsA(isInstanceOf<AccountNotFoundFailure>()),
      );
      verify(authService.login(any, any)).called(1);
    });

    test('correct email but wrong password', () async {
      final email = 'user@mail.com';
      final wrongPw = 'wrongPassword';

      when(authService.login(any, any))
          .thenAnswer((_) => throw WrongPasswordFailure);

      expect(
        () => usecase.login(email, wrongPw),
        throwsA(isInstanceOf<WrongPasswordFailure>()),
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
