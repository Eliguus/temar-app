import 'package:bloc/bloc.dart';
import 'package:flutter_application_test/infrastructure/auth/repository.dart';

import 'login_event.dart';
import 'login_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthRepository userRepository;
  AuthBloc({required this.userRepository}) : super(LoginState()) {
    on<LoginEvent>((LoginEvent event, Emitter<AuthState> emit) async {
      emit(LoggingInState());
      final result =
          await userRepository.authenticate(event.email, event.password);
      result.fold((error) => emit(LoginFailedState()),
          (id) => emit(LoginSuccessfulState(id: id)));
    });
  }
}
