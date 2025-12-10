import 'package:saferoute/features/auth/data/dtos/auth_response_dto.dart' show AuthResponseDto;
import 'package:saferoute/features/auth/data/dtos/user_dto.dart';
import 'package:saferoute/features/auth/domain/auth_session.dart';
import 'package:saferoute/features/auth/domain/user.dart';

extension UserDtoMapper on UserDto {
  User toDomain() {
    return User(
      id: id,
      email: email,
      name: name,
      role: role,
      isEmailVerified: isEmailVerified,
    );
  }
}

extension AuthResponseDtoMapper on AuthResponseDto {
  AuthSession toDomain() {
    return AuthSession(
      accessToken: accessToken,
      refreshToken: refreshToken,
      user: user.toDomain(),
    );
  }
}