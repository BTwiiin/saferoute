import 'package:flutter_riverpod/legacy.dart';
import 'package:saferoute/features/auth/application/usecases/login_usecase.dart';
import 'package:saferoute/features/auth/application/usecases/login_with_apple_usecase.dart';
import 'package:saferoute/features/auth/application/usecases/login_with_google_usecase.dart';
import 'package:saferoute/features/auth/application/usecases/register_usecase.dart';
import 'package:saferoute/features/auth/data/local/auth_token_storage.dart';
import 'package:saferoute/features/auth/domain/auth_session.dart';
import 'package:saferoute/features/auth/presentation/providers/auth_state.dart';

class AuthNotifier extends StateNotifier<AuthState> {
  final LoginUseCase _loginUseCase;
  final RegisterUseCase _registerUseCase;
  final LoginWithGoogleUseCase _loginWithGoogleUseCase;
  final LoginWithAppleUseCase _loginWithAppleUseCase;
  final AuthTokenStorage _tokenStorage;

  AuthNotifier({
    required LoginUseCase loginUseCase,
    required RegisterUseCase registerUseCase,
    required LoginWithGoogleUseCase loginWithGoogleUseCase,
    required LoginWithAppleUseCase loginWithAppleUseCase,
    required AuthTokenStorage tokenStorage,
  })  : _loginUseCase = loginUseCase,
        _registerUseCase = registerUseCase,
        _loginWithGoogleUseCase = loginWithGoogleUseCase,
        _loginWithAppleUseCase = loginWithAppleUseCase,
        _tokenStorage = tokenStorage,
        super(AuthState.initial()) {
    _init();
  }

  Future<void> _init() async {
    final session = await _tokenStorage.loadSession();
    if (session != null) {
      state = state.copyWith(isLoading: false, session: session);
    } else {
      state = state.copyWith(isLoading: false);
    }
  }

  Future<void> login(String email, String password) async {
    state = state.copyWith(isLoading: true, errorMessage: null);

    try {
      final session = await _loginUseCase(email: email, password: password);
      await _tokenStorage.saveSession(session);
      state = state.copyWith(isLoading: false, session: session);
    } catch (e) {
      state = state.copyWith(
        isLoading: false,
        errorMessage: e.toString(),
      );
    }
  }

  Future<bool> register(String email, String password, String name) async {
    state = state.copyWith(isLoading: true, errorMessage: null);

    try {
      await _registerUseCase(email: email, password: password, name: name);
      state = state.copyWith(isLoading: false);
      return true;
    } catch (e) {
      state = state.copyWith(
        isLoading: false,
        errorMessage: e.toString(),
      );
      return false;
    }
  }

  Future<void> loginWithGoogle(String idToken) async {
    state = state.copyWith(isLoading: true, errorMessage: null);

    try {
      final session =
          await _loginWithGoogleUseCase(idToken: idToken);
      await _tokenStorage.saveSession(session);
      state = state.copyWith(isLoading: false, session: session);
    } catch (e) {
      state = state.copyWith(
        isLoading: false,
        errorMessage: e.toString(),
      );
    }
  }

  Future<void> loginWithApple(String idToken) async {
    state = state.copyWith(isLoading: true, errorMessage: null);

    try {
      final session =
          await _loginWithAppleUseCase(idToken: idToken);
      await _tokenStorage.saveSession(session);
      state = state.copyWith(isLoading: false, session: session);
    } catch (e) {
      state = state.copyWith(
        isLoading: false,
        errorMessage: e.toString(),
      );
    }
  }

  Future<void> logout() async {
    await _tokenStorage.clear();
    state = AuthState.initial();
  }

  Future<void> updateSession(AuthSession session) async {
    await _tokenStorage.saveSession(session);
    state = state.copyWith(session: session);
  }
}
