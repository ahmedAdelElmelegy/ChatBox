part of 'story_cubit.dart';

sealed class StoryState {}

final class StoryInitial extends StoryState {}

final class StoryLoading extends StoryState {}

final class StorySucess extends StoryState {}

final class StoryFailure extends StoryState {
  final String message;
  StoryFailure(this.message);
}
