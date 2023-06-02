import 'package:dartz/dartz.dart';
import 'package:flutter_application_test/domain/auth/auth_user.dart';
import 'package:flutter_application_test/infrastructure/auth/datasource.dart';
import 'package:flutter_application_test/infrastructure/core/failures.dart';

class AuthRepository {
  final LoginRemoteDataSource remoteDataSource;

  AuthRepository({
    required this.remoteDataSource,
  });
  Future<Either<Failure, String>> authenticate(
      String email, String password) async {
    // Call the API to log in and get the auth token
    // For this example, I will return a dummy token
    try {
      final id = await remoteDataSource.authenticate(email, password);
      return Right(id);
    } on Exception {
      return Left(ServerFailure());
    }
  }
}
