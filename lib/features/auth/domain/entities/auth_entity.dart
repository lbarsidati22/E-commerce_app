class AuthEntity {
  String? name;
  String? email;
  String? token;
  AuthEntity({this.name, this.email, this.token});

  factory AuthEntity.fromJson(Map<String, dynamic> json) {
    return AuthEntity(
      name: json['name'],
      email: json['email'],
      token: json['token'],
    );
  }

  Map<String, dynamic> toJson() {
    return {'name': name, 'email': email, 'token': token};
  }
}
