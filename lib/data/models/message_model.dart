enum MessageType { text, image, pdf, audio, imageList }

class MessageModel {
  final String id;
  final String senderId;
  final String receiverId;
  final String content;
  final String? pdfUrl;

  final MessageType type;
  final DateTime timestamp;
  final bool isWatched;
  final List<String>? imageList; // for image group

  MessageModel({
    this.pdfUrl,
    required this.id,
    required this.senderId,
    required this.receiverId,
    required this.content,
    required this.type,
    required this.timestamp,
    required this.isWatched,
    this.imageList,
  });

  Map<String, dynamic> toMap() => {
    'id': id,
    'pdfUrl': pdfUrl,
    'senderId': senderId,
    'receiverId': receiverId,
    'content': content,
    'type': type.name,
    'timestamp': timestamp.toIso8601String(),
    'isWatched': isWatched,
    'imageList': imageList,
  };

  factory MessageModel.fromMap(Map<String, dynamic> map) => MessageModel(
    id: map['id'],
    pdfUrl: map['pdfUrl'],
    senderId: map['senderId'],
    receiverId: map['receiverId'],
    content: map['content'],
    type: MessageType.values.firstWhere((e) => e.name == map['type']),
    timestamp: DateTime.parse(map['timestamp']),
    isWatched: map['isWatched'],
    imageList: (map['imageList'] as List?)?.cast<String>(),
  );
}
