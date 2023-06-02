abstract class SignupEvent {}

class SignupButtonPressedEvent extends SignupEvent {
  final String name;
  final String email;
  final String password;
  final bool isInstructor;

  SignupButtonPressedEvent(
      {required this.isInstructor,
      required this.name,
      required this.email,
      required this.password});
}
