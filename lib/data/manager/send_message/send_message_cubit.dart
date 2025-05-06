import 'dart:io';

import 'package:chat_box/core/helpers/extentions.dart';
import 'package:chat_box/data/models/message_model.dart';
import 'package:chat_box/data/repo/chat_repo.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_contacts/flutter_contacts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:share_plus/share_plus.dart';
import 'package:uuid/uuid.dart';

part 'send_message_state.dart';

class SendMessageCubit extends Cubit<SendMessageState> {
  SendMessageCubit(this.chatRepo) : super(SendMessageInitial());

  final ChatRepo chatRepo;
  static SendMessageCubit get(context) => BlocProvider.of(context);

  TextEditingController textController = TextEditingController();
  List<XFile> images = [];
  String pdfUrl = '';

  Future<void> selectImage(ImageSource source) async {
    final image = await ImagePicker().pickImage(source: source);
    if (image != null) {
      images = [image];
      emit(ImageSelected());
      pop();
    }
  }

  Future<void> selectImages() async {
    final pickedImages = await ImagePicker().pickMultiImage();
    if (pickedImages.isNotEmpty) {
      images = pickedImages;
      emit(ImageSelected());
      pop();
    }
  }

  Future<void> clearImage() async {
    images.clear();
    emit(ImageCleared());
  }

  Future<void> pickPdf() async {
    final result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowMultiple: true,
      allowedExtensions: ['pdf'],
    );

    if (result != null && result.files.single.path != null) {
      final file = File(result.files.single.path!);
      emit(SendPdfLoading());
      pdfUrl = await uploadPdf(file);

      emit(
        SendMessagePdfSelected(pdfUrl),
      ); // Optional: emit a state to notify PDF selection
      pop();
    }
  }

  Future<String> uploadPdf(File file) async {
    final fileName = file.path.split('/').last;
    final ref = FirebaseStorage.instance.ref().child('chat_pdfs/$fileName.pdf');
    await ref.putFile(file);
    final url = await ref.getDownloadURL();
    return url;
  }

  /// Uploads images and returns list of download URLs
  Future<List<String>> _uploadImages() async {
    final storage = FirebaseStorage.instance;
    List<String> downloadUrls = [];

    for (final image in images) {
      final file = File(image.path);
      final fileName = DateTime.now().millisecondsSinceEpoch.toString();
      final ref = storage.ref().child('chat_images/$fileName.jpg');

      final uploadTask = await ref.putFile(file);
      final url = await ref.getDownloadURL();
      downloadUrls.add(url);
    }

    return downloadUrls;
  }

  Future<void> sendMessage({
    required String receiverId,
    required String senderId,
  }) async {
    emit(SendMessageLoading());

    try {
      List<String> imageUrls = [];

      if (images.isNotEmpty) {
        imageUrls = await _uploadImages();
      }
      // final contact = await pickFirstContact();
      // if (contact == null) {
      //   emit(SendMessageFailure("No contact found"));
      //   return;
      // }

      // final name = contact.displayName;
      // final phone =
      //     contact.phones.isNotEmpty ? contact.phones.first.number : 'No Phone';

      // final contactText = 'Name: $name\nPhone: $phone';

      final message = MessageModel(
        id: const Uuid().v4(),
        pdfUrl: pdfUrl,
        senderId: senderId,
        receiverId: receiverId,
        content: textController.text,
        type: _getMessageType(),

        timestamp: DateTime.now(),
        isWatched: false,
        imageList: imageUrls,
      );

      final result = await chatRepo.sendMessage(message);
      result.fold(
        (l) => emit(SendMessageFailure(l.message)),
        (r) => emit(SendMessageSucess()),
      );

      // Clear form
      textController.clear();
      images.clear();
      pdfUrl = '';
      emit(ImageCleared());
    } catch (e) {
      emit(SendMessageFailure('Failed to send message: $e'));
    }
  }

  MessageType _getMessageType() {
    if (images.isNotEmpty) return MessageType.image;
    if (pdfUrl.isNotEmpty) return MessageType.pdf;
    return MessageType.text;
  }

  // Future<void> shareFirstContact() async {
  //   if (await Permission.contacts.request().isGranted) {
  //     final contacts = await FlutterContacts.getContacts(withProperties: true);

  //     if (contacts.isNotEmpty) {
  //       final contact = contacts.first;

  //       final name = contact.displayName ?? 'No Name';
  //       final phone =
  //           contact.phones.isNotEmpty
  //               ? contact.phones.first.number
  //               : 'No Phone';

  //       final contactText = 'Name: $name\nPhone: $phone';

  //       Share.share(contactText);
  //     } else {
  //       print('No contacts found.');
  //     }
  //   } else {
  //     print('Contact permission denied.');
  //   }
  // }

  Future<void> requestContactPermission() async {
    final status = await Permission.contacts.request();
    if (!status.isGranted) {
      throw Exception('Contact permission not granted');
    }
  }

  // Future<Contact?> pickFirstContact() async {
  //   await requestContactPermission();
  //   final contacts = await FlutterContacts.getContacts(withProperties: true);
  //   if (contacts.isNotEmpty) {
  //     return contacts.first;
  //   }
  //   return null;
  // }
}
