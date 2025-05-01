class UserModel {
  String email;

  String name;
  String image;
  String uid;
  UserModel({
    required this.uid,
    required this.email,
    required this.name,
    required this.image,
  });

  factory UserModel.fromMap(Map<String, dynamic> map) => UserModel(
    uid: map['uid'],
    email: map['email'],
    name: map['name'],
    image: map['image'],
  );
  Map<String, dynamic> toMap() => {
    'uid': uid,
    'email': email,
    'name': name,
    'image': image,
  };
}
