class SignUpUserModel {
  final String name;
  final String email;
  final String password;
  final String image;

  SignUpUserModel({
    required this.name,
    required this.email,
    required this.image,
    required this.password,
  });

  Map<String, dynamic> toMap() => {
    name: 'name',
    email: 'email',
    image: 'image',
    password: 'password',
  };
}
