import 'package:equatable/equatable.dart';

class User extends Equatable {
  final String name;
  final String email;
  final bool isAdmin;
  final bool isInstructor;
  final int id;
  const User(
      {required this.isAdmin,
      required this.isInstructor,
      required this.name,
      required this.email,
      required this.id});

  @override
  List<Object?> get props => ([email, name, isInstructor, isAdmin]);
}
