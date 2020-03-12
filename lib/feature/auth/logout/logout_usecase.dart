import 'package:meta/meta.dart';
import 'package:tennis_club/feature/auth/auth_service.dart';

class LogoutUseCase {
  LogoutUseCase({
    @required AuthService authService,
  })  : assert(authService != null),
        _authService = authService;

  final AuthService _authService;

  /// Logs out the user that is currently logged in (if any).
  ///
  /// See [AuthService.logout] for possible thrown failures.
  Future logout() {
    return _authService.logout();
  }
}
