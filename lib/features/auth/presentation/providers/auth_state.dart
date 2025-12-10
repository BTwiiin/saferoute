import 'package:saferoute/features/auth/domain/auth_session.dart';

class AuthState {
  final bool isLoading;
  final AuthSession? session;
  final String? errorMessage;

  const AuthState({
    this.isLoading = false,
    this.session,
    this.errorMessage,
  });

  AuthState copyWith({
    bool? isLoading,
    AuthSession? session,
    String? errorMessage,
  }) {
    return AuthState(
      isLoading: isLoading ?? this.isLoading,
      session: session ?? this.session,
      errorMessage: errorMessage,
    );
  }

  factory AuthState.initial() => const AuthState();
}