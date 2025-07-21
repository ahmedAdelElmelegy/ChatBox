// import 'dart:io';

// import 'package:flutter/material.dart';
// import 'package:flutter_sound/flutter_sound.dart';
// import 'package:permission_handler/permission_handler.dart';
// import 'package:path_provider/path_provider.dart';
// import 'package:firebase_storage/firebase_storage.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter_svg/flutter_svg.dart'; // Import to load SVG icons

// class VoiceMessageScreen extends StatefulWidget {
//   @override
//   // ignore: library_private_types_in_public_api
//   _VoiceMessageScreenState createState() => _VoiceMessageScreenState();
// }

// class _VoiceMessageScreenState extends State<VoiceMessageScreen> {
//   FlutterSoundRecorder _audioRecorder = FlutterSoundRecorder();
//   bool isRecording = false;
//   String? filePath;
//   bool isSendable = false;
//   late Stopwatch _stopwatch;

//   @override
//   void initState() {
//     super.initState();
//     _initializeAudioRecorder();
//     _stopwatch = Stopwatch();
//   }

//   Future<void> _initializeAudioRecorder() async {
//     await Permission.microphone.request();
//     if (await Permission.microphone.isGranted) {
//       await _audioRecorder.openRecorder();
//     }
//   }

//   Future<void> _startRecording() async {
//     if (!await Permission.microphone.isGranted) {
//       print("Microphone permission is not granted");
//       return;
//     }

//     final directory = await getApplicationDocumentsDirectory();
//     filePath = '${directory.path}/voice_message.aac';

//     await _audioRecorder.startRecorder(toFile: filePath, codec: Codec.aacADTS);
//     _stopwatch.start();
//     setState(() {
//       isRecording = true;
//     });
//   }

//   Future<void> _stopRecording() async {
//     await _audioRecorder.stopRecorder();
//     _stopwatch.stop();
//     setState(() {
//       isRecording = false;
//       isSendable = true; // Enable sending the message
//     });

//     // Send the message when the recording is stopped
//     _sendVoiceMessage();
//   }

//   Future<void> _sendVoiceMessage() async {
//     if (filePath == null || !isSendable) return;

//     final storageRef = FirebaseStorage.instance.ref().child(
//       "voice_messages/${DateTime.now().millisecondsSinceEpoch}.aac",
//     );

//     // Upload to Firebase Storage
//     await storageRef.putFile(File(filePath!));

//     final downloadUrl = await storageRef.getDownloadURL();

//     // Save the message info in Firestore
//     FirebaseFirestore.instance.collection('messages').add({
//       'senderId': 'user123', // Replace with the actual sender ID
//       'receiverId': 'user456', // Replace with the actual receiver ID
//       'messageType': 'voice',
//       'fileUrl': downloadUrl,
//       'timestamp': DateTime.now(),
//       'duration':
//           _stopwatch.elapsed.inSeconds, // Save the duration of the recording
//     });

//     setState(() {
//       isSendable = false; // Reset sendable state
//     });
//   }

//   @override
//   void dispose() {
//     _audioRecorder.closeRecorder();
//     _stopwatch.stop();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text('Voice Message')),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             GestureDetector(
//               onTap: () {
//                 if (isRecording) {
//                   // If it's already recording, stop recording
//                   _stopRecording();
//                 } else {
//                   // If not recording, start recording
//                   _startRecording();
//                 }
//               },
//               child: Container(
//                 padding: EdgeInsets.all(20),
//                 color: Colors.blue,
//                 child: SvgPicture.asset(
//                   'assets/icons/microphone.svg', // Replace with the actual path to your SVG
//                   width: 50,
//                   height: 50,
//                   color: Colors.white, // Customize the color if necessary
//                 ),
//               ),
//             ),
//             if (isRecording)
//               Text("Recording: ${_stopwatch.elapsed.inSeconds} seconds"),
//             if (!isRecording && isSendable)
//               ElevatedButton(
//                 onPressed: _sendVoiceMessage,
//                 child: Text("Send Message"),
//               ),
//           ],
//         ),
//       ),
//     );
//   }
// }
