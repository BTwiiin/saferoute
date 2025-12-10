import 'package:dio/dio.dart';
import 'package:saferoute/features/auth/data/dtos/auth_response_dto.dart';

class AuthApiService {
  final Dio _dio;

  AuthApiService(this._dio);

  Future<AuthResponseDto> login(String email, String password) async {
    final res = await _dio.post('/auth/login', data: {
      'email': email,
      'password': password,
    });

    return AuthResponseDto.fromJson(res.data);
  }

  Future<AuthResponseDto> register(String email, String password, String name) async {
    final res = await _dio.post('/auth/register', data: {
      'email': email,
      'password': password,
      'name': name,
    });

    return AuthResponseDto.fromJson(res.data);
  }

  Future<AuthResponseDto> loginWithGoogle(String idToken) async {
    final res = await _dio.post(
      '/auth/providers/google/login',
      data: {'idToken': idToken},
    );
    return AuthResponseDto.fromJson(res.data);
  }

  Future<AuthResponseDto> loginWithApple(String idToken) async {
    final res = await _dio.post(
      '/auth/providers/apple/login',
      data: {'idToken': idToken},
    );
    return AuthResponseDto.fromJson(res.data);
  }

  Future<AuthResponseDto> refresh(String refreshToken) async {
    final res = await _dio.post('/auth/refresh-token', data: {
      'refreshToken': refreshToken,
    });

    return AuthResponseDto.fromJson(res.data);
  }
}
