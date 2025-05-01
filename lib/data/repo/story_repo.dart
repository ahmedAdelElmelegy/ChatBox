import 'dart:io';

import 'package:chat_box/core/error/failure.dart';
import 'package:chat_box/data/models/story_model.dart';
import 'package:chat_box/data/services/firebase_services.dart';
import 'package:dartz/dartz.dart';

class StoryRepo {
  final FirebaseServices firebaseServices;
  StoryRepo(this.firebaseServices);

  Future<Either<Failure, String>> uploadStoryImage(File file) async {
    try {
      final url = await firebaseServices.uploadStory(file);
      return Right(url);
    } catch (e) {
      return Left(FirebaseFailure(e.toString()));
    }
  }

  Future<Either<Failure, void>> createStory(StoryModel story) async {
    try {
      await firebaseServices.CreateStory(story);
      return const Right(null);
    } catch (e) {
      return Left(FirebaseFailure(e.toString()));
    }
  }
}
