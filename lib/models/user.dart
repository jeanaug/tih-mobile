class User {
  final String id;
  final String userName;
  final String email;
  final String password;
  final DateTime createdAt;

  User(
    this.id,
    this.userName,
    this.email,
    this.password,
    this.createdAt,
  );

  User.fromJson(Map<String, dynamic> json)
      : id = json['_id'],
        userName = json['userName'],
        email = json['email'],
        password = json['password'],
        createdAt = DateTime.parse(json['createdAt']);

  @override
  String toString() {
    return 'User(id: $id, userName: $userName, email: $email, password: $password, createdAt: $createdAt)';
  }
}
