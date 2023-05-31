import 'package:equatable/equatable.dart';

class User extends Equatable {
  final String name;
  final String email;
  final String password;
  final bool isAdmin;
  final bool isInstructor;
  final String id;
  const User(
      {required this.isAdmin,
      required this.isInstructor,
      required this.name,
      required this.email,
      required this.password,
      required this.id});

  @override
  List<Object?> get props => ([email, password, name, isInstructor, isAdmin]);
}
