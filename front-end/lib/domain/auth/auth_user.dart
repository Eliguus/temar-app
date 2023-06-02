import 'package:equatable/equatable.dart';

class AuthUser extends Equatable {
  final String name;
  final String email;
  final String id;
  const AuthUser(
      {
      required this.name,
      required this.email,
      required this.id});

  @override
  List<Object?> get props => ([email, name, id]);
}
