import '../../infrastructure/auth/auth_repository.dart';
import '../../infrastructure/core/providers.dart';

class AuthProvider {
  static AuthRepository provideAuthRepository() {
    return new AuthRepository(
        CoreInfrastractureProvider.provideCleanApiClient());
  }
}
