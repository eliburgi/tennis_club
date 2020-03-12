@TestOn('vm')

import 'package:flutter_test/flutter_test.dart';
import 'package:tennis_club/feature/auth/login/login_bloc.dart';

void main() {
  group('LoginBloc - ', () {
    test('calling constructor with illegal arguments', () {
      expect(() => LoginBloc(authService: null), throwsAssertionError);
    });
  });
}
