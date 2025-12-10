class UserDto {
  final String id;
  final String email;
  final String role;
  final String name;
  final bool isEmailVerified;

  UserDto({
    required this.id,
    required this.email,
    required this.role,
    required this.name,
    required this.isEmailVerified,
  });

  factory UserDto.fromJson(Map<String, dynamic> json) {
    return UserDto(
      id: json['id'].toString(),
      email: json['email'],
      role: json['role'],
      name: json['name'],
      isEmailVerified: json['isEmailVerified'],
    );
  }
}
