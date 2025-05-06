import 'package:chat_box/core/error/failure.dart';
import 'package:chat_box/data/models/story_model.dart';
import 'package:chat_box/data/services/firebase_services.dart';
import 'package:dartz/dartz.dart';

class GetStoryRepo {
  final FirebaseServices firebaseServices;
  GetStoryRepo(this.firebaseServices);

  Stream<Either<Failure, List<StoryModel>>> getStories() {
    return firebaseServices.getStories().map((snapshot) {
      try {
        final stories =
            snapshot.docs.map((doc) => StoryModel.fromMap(doc.data())).toList();
        return Right(stories);
      } catch (e) {
        return Left(FirebaseFailure(e.toString()));
      }
    });
  }
}
