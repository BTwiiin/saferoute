import 'package:saferoute/features/auth/domain/auth_repository.dart';
import 'package:saferoute/features/auth/domain/auth_session.dart';

class LoginUseCase {
  final IAuthRepository repository;

  LoginUseCase(this.repository);

  Future<AuthSession> call({
    required String email,
    required String password,
  }) async {
    return await repository.login(email, password);
  }
}