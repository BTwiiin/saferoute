import 'user_dto.dart';

class AuthResponseDto {
  final String accessToken;
  final String refreshToken;
  final UserDto user;

  AuthResponseDto({
    required this.accessToken,
    required this.refreshToken,
    required this.user,
  });

  factory AuthResponseDto.fromJson(Map<String, dynamic> json) {
    return AuthResponseDto(
      accessToken: json['accessToken'],
      refreshToken: json['refreshToken'],
      user: UserDto.fromJson(json['user']),
    );
  }
}
