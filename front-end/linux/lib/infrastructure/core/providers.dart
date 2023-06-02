import 'dart:developer';

import '../../network/api_client.dart';
import '../auth/token_store.dart';

class CoreInfrastractureProvider {
  static ApiClient? cleanApiClient;
  static ApiClient? authenticatedApiClient;

  static ApiClient provideCleanApiClient() {
    var config;
    cleanApiClient ??= ApiClient(config.API_HOST, baseUrl: config.API_PATH);
    return cleanApiClient!;
  }

  static Future<ApiClient> provideAuthenticatedApiClient() async {
    if (authenticatedApiClient == null) {
      String? token = await TokenStorage.getToken();
      if (token == null) {
        throw Exception("Token not found");
      }
      log("Token: $token");
      authenticatedApiClient =
          ApiClient('http://localhost:3000', baseUrl: '/', token: token);
    }

    return authenticatedApiClient!;
  }

  void reset() {
    cleanApiClient = null;
    authenticatedApiClient = null;
  }
}
