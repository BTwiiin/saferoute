import 'package:saferoute/features/auth/data/auth_api_service.dart';
import 'package:saferoute/features/auth/data/auth_mappers.dart';
import 'package:saferoute/features/auth/domain/auth_repository.dart';
import 'package:saferoute/features/auth/domain/auth_session.dart';

class AuthRepositoryImpl implements IAuthRepository {
  final AuthApiService api;

  AuthRepositoryImpl(this.api);

  @override
  Future<AuthSession> login(String email, String password) async {
    final dto = await api.login(email, password);
    return dto.toDomain();
  }

  @override
  Future<AuthSession> register(String email, String password, String name) async {
    final dto = await api.register(email, password, name);
    return dto.toDomain();
  }

  @override
  Future<AuthSession> loginWithGoogle(String idToken) async {
    final dto = await api.loginWithGoogle(idToken);
    return dto.toDomain();
  }

  @override
  Future<AuthSession> loginWithApple(String idToken) async {
    final dto = await api.loginWithApple(idToken);
    return dto.toDomain();
  }
}
