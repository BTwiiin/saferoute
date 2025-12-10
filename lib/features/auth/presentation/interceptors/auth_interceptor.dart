import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:saferoute/features/auth/data/auth_api_service.dart';
import 'package:saferoute/features/auth/data/auth_mappers.dart';
import 'package:saferoute/features/auth/domain/auth_session.dart';
import '../../data/local/auth_token_storage.dart';
import '../providers/auth_providers.dart';

class AuthInterceptor extends Interceptor {
  final AuthTokenStorage tokenStorage;
  final AuthApiService refreshApi;
  final Ref ref;

  bool _isRefreshing = false;

  AuthInterceptor({
    required this.tokenStorage,
    required this.refreshApi,
    required this.ref,
  });

  @override
  Future<void> onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    final session = await tokenStorage.loadSession();
    final accessToken = session?.accessToken;

    if (accessToken != null && accessToken.isNotEmpty) {
      options.headers['Authorization'] = 'Bearer $accessToken';
    }

    handler.next(options);
  }

  @override
  Future<void> onError(
    DioException err,
    ErrorInterceptorHandler handler,
  ) async {
    final response = err.response;
    final isUnauthorized = response?.statusCode == 401;

    // If not 401 or already trying to refresh, just forward error
    if (!isUnauthorized || _isRefreshing) {
      handler.next(err);
      return;
    }

    _isRefreshing = true;

    try {
      final oldSession = await tokenStorage.loadSession();
      final refreshToken = oldSession?.refreshToken;

      if (refreshToken == null || refreshToken.isEmpty) {
        await _handleLogout();
        handler.next(err);
        return;
      }

      // Call refresh endpoint (you need to implement it on backend)
      final newSession = await _refreshTokens(refreshToken);

      // Save and update state
      await tokenStorage.saveSession(newSession);
      await ref
          .read(authNotifierProvider.notifier)
          .updateSession(newSession);

      // Retry original request with new token
      final requestOptions = err.requestOptions;
      requestOptions.headers['Authorization'] =
          'Bearer ${newSession.accessToken}';

      final dio = ref.read(dioProvider);
      final newResponse = await dio.fetch(requestOptions);
      handler.resolve(newResponse);
    } catch (_) {
      await _handleLogout();
      handler.next(err);
    } finally {
      _isRefreshing = false;
    }
  }

  Future<AuthSession> _refreshTokens(String refreshToken) async {
    final dto = await refreshApi.refresh(refreshToken);
    return dto.toDomain();
  }

  Future<void> _handleLogout() async {
    await tokenStorage.clear();
    ref.read(authNotifierProvider.notifier).logout();
  }
}
