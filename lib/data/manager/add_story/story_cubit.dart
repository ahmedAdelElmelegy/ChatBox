import 'dart:io';

import 'package:chat_box/data/repo/story_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';

part 'story_state.dart';

class StoryCubit extends Cubit<StoryState> {
  StoryCubit(this.storyRepo) : super(StoryInitial());
  StoryRepo storyRepo;
  static StoryCubit get(context) => BlocProvider.of(context);

  Future uploadStoryWithoutImage(String uid) async {}
  Future<void> uploadStory(String caption, File file) async {
    emit(StoryLoading());
    final result = await storyRepo.uploadStoryImage(file, caption);
    result.fold(
      (l) {
        emit(StoryFailure(l.message));
        Fluttertoast.showToast(msg: l.message);
      },
      (r) {
        Fluttertoast.showToast(msg: 'Upload Story Successfully');
        emit(StorySucess());
      },
    );
  }
}
