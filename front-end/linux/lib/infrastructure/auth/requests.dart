import 'dart:convert';

import '../../domain/auth/auth_user.dart';
import '../../domain/auth/login_response.dart';
import '../../domain/auth/user.dart';
import '../../network/request.dart';
import 'auth_serializers.dart';

class LoginRequest extends Request<LoginResponse> {
  LoginResponseSerializer serializer = LoginResponseSerializer();

  LoginRequest(username, password)
      : super("/auth/signin/",
            method: Method.post,
            postParams: {"username": username, "password": password});

  @override
  LoginResponse deserializeObject(response) {
    return serializer.deSerialize(jsonDecode(response));
  }
}

class SignupRequest extends Request<LoginResponse> {
  LoginResponseSerializer serializer = LoginResponseSerializer();
  AuthUser authuser;

  SignupRequest(this.authuser)
      : super("/auth/signup/", method: Method.post, postParams: {
          "name": authuser.name,
          "email": authuser.email,
          "password": authuser.password,
          "isInstructor": authuser.isInstructor
        });

  @override
  LoginResponse deserializeObject(response) {
    return serializer.deSerialize(jsonDecode(response));
  }
}

class GetMyAccountRequest extends Request<User> {
  UserSerializer userSerializer = UserSerializer();

  GetMyAccountRequest() : super("/auth/my-account");

  @override
  User deserializeObject(response) {
    return userSerializer.deSerialize(jsonDecode(response));
  }
}
