import 'token.dart';

class LoginResponse {
  JWTToken token;
  String id;
  LoginResponse({required this.token, required this.id});
}
