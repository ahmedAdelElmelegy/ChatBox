class LoginUserModel {
  final String email;
  final String password;

  const LoginUserModel({required this.email, required this.password});

  factory LoginUserModel.fromMap(Map<String, dynamic> map) {
    return LoginUserModel(email: map['email'], password: map['password']);
  }

  Map<String, dynamic> toMap() {
    return {'email': email, 'imageUrl': password};
  }
}
