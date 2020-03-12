import 'auth_service.dart';

class FakeAuthService implements AuthService {
  @override
  Future<User> login(String email, String password) async {
    return User(id: '#1', name: 'Test User');
  }
}
