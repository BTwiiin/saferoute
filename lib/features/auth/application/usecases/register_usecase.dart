import 'package:saferoute/features/auth/domain/auth_repository.dart';
import 'package:saferoute/features/auth/domain/auth_session.dart';

class RegisterUseCase {
  final IAuthRepository repository;

  RegisterUseCase(this.repository);

  Future<AuthSession> call({
    required String email,
    required String password,
    required String name,
  }) async {
    return await repository.register(email, password, name);
  }
}