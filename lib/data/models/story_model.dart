class StoryModel {
  final String id;
  final String userId;
  final String imageUrl;
  final String caption;
  final DateTime timestamp;

  StoryModel({
    required this.id,
    required this.userId,
    required this.imageUrl,
    required this.caption,
    required this.timestamp,
  });

  Map<String, dynamic> toJson() => {
    'id': id,
    'userId': userId,
    'imageUrl': imageUrl,
    'caption': caption,
    'timestamp': timestamp.toIso8601String(),
  };

  factory StoryModel.fromJson(Map<String, dynamic> json) => StoryModel(
    id: json['id'],
    userId: json['userId'],
    imageUrl: json['imageUrl'],
    caption: json['caption'] ?? '',
    timestamp: DateTime.parse(json['timestamp']),
  );
}
