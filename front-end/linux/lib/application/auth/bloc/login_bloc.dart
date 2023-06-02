import 'package:bloc/bloc.dart';

import '../../../di/auth/AuthProviders.dart';
import '../../../infrastructure/auth/auth_repository.dart';
import 'login_event.dart';
import 'login_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthRepository userRepository = AuthProvider.provideAuthRepository();

  AuthBloc() : super(LoginState()) {
    on<LoginEvent>((LoginEvent event, Emitter<AuthState> emit) async {
      emit(LoggingInState());
      final result = await userRepository.login(event.email, event.password);
      result.fold((error) => emit(LoginFailedState()),
          (loginResponse) => emit(LoginSuccessfulState()));
    });
  }
}
