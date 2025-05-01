class StoryModel {
  final String imageUrl;
  final int timestamp;
  final int duration;
  final String uid;

  StoryModel({
    required this.uid,
    required this.imageUrl,
    required this.timestamp,
    required this.duration,
  });

  factory StoryModel.fromMap(Map<String, dynamic> map) {
    return StoryModel(
      uid: map['uid'],
      imageUrl: map['imageUrl'],
      timestamp: map['timestamp'],
      duration: map['duration'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'imageUrl': imageUrl,
      'timestamp': timestamp,
      'duration': duration,
      'uid': uid,
    };
  }
}
