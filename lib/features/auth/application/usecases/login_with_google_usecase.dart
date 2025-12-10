import 'package:saferoute/features/auth/domain/auth_session.dart';
import 'package:saferoute/features/auth/domain/auth_repository.dart';

class LoginWithGoogleUseCase {
  final IAuthRepository _repository;

  LoginWithGoogleUseCase(this._repository);

  Future<AuthSession> call({required String idToken}) {
    return _repository.loginWithGoogle(idToken);
  }
}
