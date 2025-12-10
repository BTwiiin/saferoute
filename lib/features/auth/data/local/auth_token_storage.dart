import 'dart:convert';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:saferoute/features/auth/domain/auth_session.dart';
import 'package:saferoute/features/auth/domain/user.dart';

class AuthTokenStorage {
  static const _keySession = 'auth_session';

  final FlutterSecureStorage _storage;

  const AuthTokenStorage(this._storage);

  Future<void> saveSession(AuthSession session) async {
    final jsonMap = {
      'accessToken': session.accessToken,
      'refreshToken': session.refreshToken,
      'user': {
        'id': session.user.id,
        'email': session.user.email,
        'name': session.user.name,
        'role': session.user.role,
        'isEmailVerified': session.user.isEmailVerified,
      },
    };

    await _storage.write(
      key: _keySession,
      value: jsonEncode(jsonMap),
    );
  }

  Future<AuthSession?> loadSession() async {
    final value = await _storage.read(key: _keySession);
    if (value == null) return null;

    try {
      final map = jsonDecode(value) as Map<String, dynamic>;
      final userMap = map['user'] as Map<String, dynamic>;

      final user = User(
        id: userMap['id'] as String,
        email: userMap['email'] as String,
        name: userMap['name'] as String,
        role: userMap['role'] as String,
        isEmailVerified: userMap['isEmailVerified'] as bool,
      );

      return AuthSession(
        accessToken: map['accessToken'] as String,
        refreshToken: map['refreshToken'] as String,
        user: user,
      );
    } catch (_) {
      // corrupted data -> clear
      await clear();
      return null;
    }
  }

  Future<void> clear() async {
    await _storage.delete(key: _keySession);
  }
}
