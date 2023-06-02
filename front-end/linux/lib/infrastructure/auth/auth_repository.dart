import 'package:dartz/dartz.dart';

import '../../domain/auth/auth_user.dart';
import '../../domain/auth/login_response.dart';
import '../../network/api_client.dart';
import '../core/failures.dart';
import 'requests.dart';
import 'token_store.dart';

class AuthRepository {
  final ApiClient _apiClient;

  AuthRepository(this._apiClient);

  Future<Either<Failure, LoginResponse>> login(
      String email, String password) async {
    try {
      final request = LoginRequest(email, password);
      final response = await _apiClient.execute(request);
      await TokenStorage.save(response.id, response.token.toString());
      return Right(response);
    } catch (e) {
      return Left(ServerFailure());
    }
  }

  Future<Either<Failure, LoginResponse>> signUp(
      String name, String email, String password, bool isInstructor) async {
    try {
      final request = SignupRequest(AuthUser(
          name: name,
          email: email,
          password: password,
          isInstructor: isInstructor));
      final response = await _apiClient.execute(request);
      await TokenStorage.save(response.id, response.token.toString());
      return Right(response);
    } catch (e) {
      return Left(ServerFailure());
    }
  }
}
