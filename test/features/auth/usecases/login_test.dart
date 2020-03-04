@TestOn('vm')

import 'package:flutter_test/flutter_test.dart';
import 'package:tennis_club/features/auth/usecases/login.dart';

void main() {
  test('invalid constructor arguments', () {
    expect(() => LoginUseCase(authService: null), throwsAssertionError);
  });
}
