import 'package:chat_box/data/models/story_model.dart';
import 'package:chat_box/data/repo/get_story_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'get_story_state.dart';

class GetStoryCubit extends Cubit<GetStoryState> {
  GetStoryCubit(this.getStoryRepo) : super(GetStoryInitial());
  static GetStoryCubit get(context) => BlocProvider.of(context);
  GetStoryRepo getStoryRepo;
  List<StoryModel> stories = [];
  void getStory() {
    emit(GetStoryLoading());
    getStoryRepo.getStories().listen((either) {
      either.fold((failure) => emit(GetStoryFailure(failure.message)), (
        stories,
      ) {
        emit(GetStorySucess(stories));
        this.stories = stories;
      });
    });
  }
}
