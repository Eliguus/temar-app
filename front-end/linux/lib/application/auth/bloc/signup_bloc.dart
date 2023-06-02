import 'package:bloc/bloc.dart';

import '../../../di/auth/AuthProviders.dart';
import '../../../domain/auth/login_response.dart';
import '../../../infrastructure/auth/auth_repository.dart';
import '../../../infrastructure/core/failures.dart';
import 'signup_event.dart';
import 'signup_state.dart';

class SignupBloc extends Bloc<SignupEvent, SignupState> {
  final AuthRepository userRepository = AuthProvider.provideAuthRepository();

  SignupBloc() : super(SignupInitialState()) {
    on<SignupButtonPressedEvent>(
        (SignupButtonPressedEvent event, Emitter<SignupState> emit) async {
      emit(SignupLoadingState());

      final result = await userRepository.signUp(
          event.name, event.email, event.password, event.isInstructor);

      result.fold(
        (Failure failure) => emit(SignupFailureState(error: 'Failed')),
        (LoginResponse response) => emit(SignupSuccessState()),
      );
    });
  }
}
