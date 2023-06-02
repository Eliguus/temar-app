import 'package:equatable/equatable.dart';

class AuthUser extends Equatable {
  final String name;
  final String email;
  final String? id;
  final String? password;
  final bool isInstructor;
  const AuthUser(
      {required this.isInstructor,
      this.password,
      required this.name,
      required this.email,
      this.id});

  @override
  List<Object?> get props => ([password, email, name, id]);
}
