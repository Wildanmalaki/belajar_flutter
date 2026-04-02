class UserModel15 {
  final int id;
  final String name;
  final String email;
  final String? createdAt;
  final String? updatedAt;

  UserModel15({
    required this.id,
    required this.name,
    required this.email,
    this.createdAt,
    this.updatedAt,
  });

  factory UserModel15.fromJson(Map<String, dynamic> json) {
    return UserModel15(
      id: json['id'] ?? 0,
      name: json['name'] ?? '-',
      email: json['email'] ?? '-',
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
    );
  }
}

class AuthResult15 {
  final String message;
  final String token;
  final UserModel15 user;

  AuthResult15({
    required this.message,
    required this.token,
    required this.user,
  });
}
