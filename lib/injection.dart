import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tennis_club/feature/auth/auth_notifier.dart';
import 'package:tennis_club/feature/auth/auth_service.dart';
import 'package:tennis_club/feature/auth/auth_service_firebase.dart';
import 'package:tennis_club/feature/auth/login/login_usecase.dart';
import 'package:tennis_club/feature/auth/logout/logout_usecase.dart';

class DependencyInjection extends StatelessWidget {
  DependencyInjection({@required this.child}) : assert(child != null);

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<AuthService>(
          create: (_) => FirebaseAuthService(),
        ),
        ChangeNotifierProvider<AuthNotifier>(
          create: (context) => AuthNotifier(
            loginUseCase: LoginUseCase(
              authService: Provider.of<AuthService>(context, listen: false),
            ),
            logoutUseCase: LogoutUseCase(
              authService: Provider.of<AuthService>(context, listen: false),
            ),
          ),
        ),
      ],
      child: child,
    );
  }
}
