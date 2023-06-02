// import 'package:dartz/dartz.dart';
// import 'package:flutter_application_test/infrastructure/core/failures.dart';


// class CourseRepository {
//   final CourseDataProvider _courseDataProvider;
//   final CourseSerializer _courseSerializer;

//   CourseRepository(this._courseDataProvider, this._courseSerializer);

//   Future<Either<Failure, List<Course>>> getEnrolledCourses(String token) async {
//     try {
//       final response = await _courseDataProvider.getEnrolledCourses(token);
//       return response.map((json) => _courseSerializer.fromJSON(json)).toList();
//     } on Exception {
//       return Left(ServerFailure());
//     }
//   }
// }
