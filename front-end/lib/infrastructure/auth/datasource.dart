import 'dart:convert';

import 'package:flutter_application_test/domain/auth/auth_user.dart';
import 'package:http/http.dart' as http;

abstract class LoginRemoteDataSource {
  Future<String> authenticate(String email, String password);
}

class LoginRemoteDataSourceImpl implements LoginRemoteDataSource {
  final http.Client httpClient;
  String? token;
  final String baseUrl = '';

  LoginRemoteDataSourceImpl({required this.httpClient});

  @override
  Future<String> authenticate(String email, String password) async {
    // Make API call and handle response, deserializing the data
    // Assume the API returns a JSON object with the user ID
    final response = await httpClient.post(
      Uri.parse('$baseUrl/user'),
      body: {'email': email, 'password': password},
    );

    if (response.statusCode == 200) {
      final responseBody = json.decode(response.body);
      token = responseBody['token'];
      print(token);

      AuthUser authUser = AuthUser(
        email: email,
        name: responseBody['name'],
        id: responseBody['_id'],
      );
      return authUser.id;
    } else {
      // Handle error
      throw Exception();
    }
  }
}
