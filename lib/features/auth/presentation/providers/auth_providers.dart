import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/legacy.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:saferoute/features/auth/application/usecases/login_with_apple_usecase.dart';
import 'package:saferoute/features/auth/application/usecases/login_with_google_usecase.dart';
import 'package:saferoute/features/auth/data/local/auth_token_storage.dart';
import 'package:saferoute/features/auth/presentation/interceptors/auth_interceptor.dart';

import '../../data/auth_api_service.dart';
import '../../data/auth_repository_impl.dart';
import '../../domain/auth_repository.dart';

import '../../../auth/application/usecases/login_usecase.dart';
import '../../../auth/application/usecases/register_usecase.dart';

import 'auth_notifier.dart';
import 'auth_state.dart';

final secureStorageProvider = Provider<FlutterSecureStorage>((ref) {
  return const FlutterSecureStorage();
});

final authTokenStorageProvider = Provider<AuthTokenStorage>((ref) {
  final storage = ref.read(secureStorageProvider);
  return AuthTokenStorage(storage);
});

final dioProvider = Provider<Dio>((ref) {
  final dio = Dio(BaseOptions(
    baseUrl: 'http://localhost:3000',
  ));

  final tokenStorage = ref.read(authTokenStorageProvider);
  final refreshApi = AuthApiService(dio);

  dio.interceptors.add(
    AuthInterceptor(
      tokenStorage: tokenStorage,
      refreshApi: refreshApi,
      ref: ref,
    ),
  );

  return dio;
});

final authApiServiceProvider = Provider<AuthApiService>((ref) {
  final dio = ref.read(dioProvider);
  return AuthApiService(dio);
});

final authRepositoryProvider = Provider<IAuthRepository>((ref) {
  final api = ref.read(authApiServiceProvider);
  return AuthRepositoryImpl(api);
});

final loginUseCaseProvider = Provider<LoginUseCase>((ref) {
  final repo = ref.read(authRepositoryProvider);
  return LoginUseCase(repo);
});

final registerUseCaseProvider = Provider<RegisterUseCase>((ref) {
  final repo = ref.read(authRepositoryProvider);
  return RegisterUseCase(repo);
});

final loginWithGoogleUseCaseProvider = Provider<LoginWithGoogleUseCase>((ref) {
  final repo = ref.read(authRepositoryProvider);
  return LoginWithGoogleUseCase(repo);
});

final loginWithAppleUseCaseProvider = Provider<LoginWithAppleUseCase>((ref) {
  final repo = ref.read(authRepositoryProvider);
  return LoginWithAppleUseCase(repo);
});

/// AuthNotifier
final authNotifierProvider =
    StateNotifierProvider<AuthNotifier, AuthState>((ref) {
  final loginUseCase = ref.read(loginUseCaseProvider);
  final registerUseCase = ref.read(registerUseCaseProvider);
  final loginWithGoogleUseCase = ref.read(loginWithGoogleUseCaseProvider);
  final loginWithAppleUseCase = ref.read(loginWithAppleUseCaseProvider);
  final tokenStorage = ref.read(authTokenStorageProvider);
  
  return AuthNotifier(
    loginUseCase: loginUseCase,
    registerUseCase: registerUseCase,
    loginWithGoogleUseCase: loginWithGoogleUseCase,
    loginWithAppleUseCase: loginWithAppleUseCase,
    tokenStorage: tokenStorage,
  );
});
