import 'package:saferoute/features/auth/domain/auth_session.dart';

// Repository pattern is used to abstract data access logic
abstract class IAuthRepository {
  Future<AuthSession> login(String email, String password);
  Future<AuthSession> register(String email, String password, String name);

  Future<AuthSession> loginWithGoogle(String idToken);
  Future<AuthSession> loginWithApple(String idToken);
}
