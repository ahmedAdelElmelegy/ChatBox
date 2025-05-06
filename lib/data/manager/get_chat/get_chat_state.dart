part of 'get_chat_cubit.dart';

sealed class GetChatState {}

final class GetChatInitial extends GetChatState {}

final class GetChatLoading extends GetChatState {}

final class GetChatSucess extends GetChatState {}

final class GetChatFailure extends GetChatState {
  final String message;
  GetChatFailure(this.message);
}
