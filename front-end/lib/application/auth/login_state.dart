abstract class AuthState {}

class LoginState extends AuthState {}

class SignupState extends AuthState {}

class LoggingInState extends AuthState {}

class SignUpingState extends AuthState {}

class LoginSuccessfulState extends AuthState {
  final String id;

  LoginSuccessfulState({required this.id});
}

class LoginFailedState extends AuthState {}
