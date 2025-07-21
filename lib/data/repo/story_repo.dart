import 'dart:io';

import 'package:chat_box/core/error/failure.dart';
import 'package:chat_box/data/services/firebase_services.dart';
import 'package:dartz/dartz.dart';

class StoryRepo {
  final FirebaseServices firebaseServices;
  StoryRepo(this.firebaseServices);

  Future<Either<Failure, void>> uploadStoryImage(
    File file,
    String caption,
  ) async {
    try {
      await firebaseServices.uploadStory(file, caption);
      return Right(null);
    } catch (e) {
      return Left(FirebaseFailure(e.toString()));
    }
  }

  // Future<Either<Failure, void>> createStory(StoryModel story) async {
  //   try {
  //     await firebaseServices.createStory(story);
  //     return const Right(null);
  //   } catch (e) {
  //     return Left(FirebaseFailure(e.toString()));
  //   }
  // }
}
