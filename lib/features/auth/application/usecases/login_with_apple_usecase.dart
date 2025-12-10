import 'package:saferoute/features/auth/domain/auth_session.dart';
import 'package:saferoute/features/auth/domain/auth_repository.dart';

class LoginWithAppleUseCase {
  final IAuthRepository _repository;

  LoginWithAppleUseCase(this._repository);

  Future<AuthSession> call({required String idToken}) {
    return _repository.loginWithApple(idToken);
  }
}
