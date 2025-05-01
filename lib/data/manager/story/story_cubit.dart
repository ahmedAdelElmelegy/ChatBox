import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:chat_box/data/models/story_model.dart';
import 'package:chat_box/data/repo/story_repo.dart';
import 'package:firebase_auth/firebase_auth.dart';

part 'story_state.dart';

class StoryCubit extends Cubit<StoryState> {
  StoryCubit(this.storyRepo) : super(StoryInitial());
  StoryRepo storyRepo;

  Future<void> uploadStoryWithImage(String uid, File? image) async {
    emit(StoryLoading());
    final userId = FirebaseAuth.instance.currentUser!.uid;

    final imageResult = await storyRepo.uploadStoryImage(image!);
    imageResult.fold(
      (failure) {
        emit(StoryFailure(failure.message));
      },
      (sucess) {
        StoryModel storyModel = StoryModel(
          imageUrl: sucess,
          timestamp: DateTime.now().microsecondsSinceEpoch,
          uid: userId,
          duration: Duration(hours: 24).inMilliseconds,
        );
        storyRepo
            .createStory(storyModel)
            .then((sucess) {
              emit(StorySucess());
            })
            .then((e) {
              emit(StoryFailure(e.toString()));
            });
      },
    );
  }
}
