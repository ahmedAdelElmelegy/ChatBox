class UserModel {
  final String uid;
  final String userToken;
  final String email;
  final String name;
  final String image;
  final String status; // 'online' | 'offline'
  final DateTime? lastSeen;
  final bool isTyping;
  final bool isBlocked; // if you want to support blocking users

  UserModel({
    required this.userToken,
    required this.uid,
    required this.email,
    required this.name,
    required this.image,
    this.status = 'offline',
    this.lastSeen,
    this.isTyping = false,
    this.isBlocked = false,
  });

  factory UserModel.fromMap(Map<String, dynamic> map) => UserModel(
    userToken: map['userToken'] ?? '',
    uid: map['uid'] ?? '',
    email: map['email'] ?? '',
    name: map['name'] ?? '',
    image: map['image'] ?? '',
    status: map['status'] ?? 'offline',
    lastSeen:
        map['lastSeen'] != null ? DateTime.tryParse(map['lastSeen']) : null,
    isTyping: map['isTyping'] ?? false,
    isBlocked: map['isBlocked'] ?? false,
  );

  Map<String, dynamic> toMap() => {
    'uid': uid,
    'email': email,
    'name': name,
    'image': image,
    'status': status,
    'lastSeen': lastSeen?.toIso8601String(),
    'isTyping': isTyping,
    'isBlocked': isBlocked,
    'userToken': userToken,
  };
}
