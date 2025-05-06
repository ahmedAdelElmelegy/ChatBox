part of 'get_story_cubit.dart';

sealed class GetStoryState {}

final class GetStoryInitial extends GetStoryState {}

final class GetStorySucess extends GetStoryState {
  final List<StoryModel> story;

  GetStorySucess(this.story);
}

final class GetStoryFailure extends GetStoryState {
  final String message;

  GetStoryFailure(this.message);
}

final class GetStoryLoading extends GetStoryState {}
