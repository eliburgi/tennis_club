import 'package:meta/meta.dart';
import 'package:bloc/bloc.dart';
import 'package:tennis_club/feature/auth/auth_service.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc({
    @required AuthService authService,
  })  : assert(authService != null),
        _authService = authService;

  final AuthService _authService;

  @override
  LoginState get initialState => LoggedOut();

  @override
  Stream<LoginState> mapEventToState(LoginEvent event) async* {
    throw UnimplementedError();
  }
}

abstract class LoginState {}

class LoggedOut extends LoginState {}

class LoggingIn extends LoginState {}

class LoggedIn extends LoginState {}

class LoginFailed extends LoginState {}

abstract class LoginEvent {}

class LoginWithEmailAndPw extends LoginEvent {}
