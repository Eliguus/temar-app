abstract class SignupState {}

class SignupInitialState extends SignupState {}

class SignupLoadingState extends SignupState {}

class SignupFailureState extends SignupState {
  final String error;

  SignupFailureState({required this.error});
}

class SignupSuccessState extends SignupState {}
