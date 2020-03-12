import 'auth_service.dart';

class FakeAuthService implements AuthService {
  @override
  Future<User> login(String email, String password) async {
    await Future.delayed(Duration(seconds: 3));
    return User(id: '#1', name: 'Test User');
  }
}
