class User {
  final String id;
  final String email;
  final String name;
  final String role;
  final bool isEmailVerified;

  const User({
    required this.id,
    required this.email,
    required this.name,
    required this.role,
    required this.isEmailVerified,
  });
}
