import '../../domain/auth/auth_user.dart';
import '../../domain/auth/login_response.dart';
import '../../domain/auth/token.dart';
import '../../domain/auth/user.dart';
import '../../network/serializer.dart';

class JWTSerializer extends Serializer<JWTToken> {
  @override
  JWTToken deSerialize(json) {
    return JWTToken(json["token"]);
  }

  @override
  serialize(JWTToken instance) {
    throw UnimplementedError();
  }
}

class UserSerializer extends Serializer<User> {
  @override
  User deSerialize(json) {
    return User(
        id: json["user"]["_id"],
        name: json["user"]["name"],
        email: json["user"]["email"],
        isAdmin: json["user"]["isAdmin"],
        isInstructor: json["isInstructor"]);
  }

  @override
  dynamic serialize(User instance) {
    return {
      "user": {
        "name": instance.name,
        "email": instance.email,
      }
    };
  }
}

class AuthUserSerializer extends Serializer<AuthUser> {
  @override
  AuthUser deSerialize(json) {
    return AuthUser(
        name: json["user"]["name"],
        email: json["user"]["email"],
        id: json["user"]["_id"],
        isInstructor: json["user"]["isInstructor"]);
  }

  @override
  dynamic serialize(AuthUser instance) {
    return {
      "user": {
        "name": instance.name,
        "email": instance.email,
      }
    };
  }
}

class LoginResponseSerializer extends Serializer<LoginResponse> {
  @override
  LoginResponse deSerialize(json) {
    return LoginResponse(token: json['token'], id: json['user']['id']);
  }

  @override
  serialize(LoginResponse instance) {
    // TODO: implement serialize
    throw UnimplementedError();
  }
}
