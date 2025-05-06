part of 'send_message_cubit.dart';

sealed class SendMessageState {}

final class SendMessageInitial extends SendMessageState {}

final class SendMessageSucess extends SendMessageState {}

final class ImageSelected extends SendMessageState {}

final class ImageCleared extends SendMessageState {}

final class SendPdfLoading extends SendMessageState {}

final class SendMessagePdfSelected extends SendMessageState {
  final String pdfUrl;
  SendMessagePdfSelected(this.pdfUrl);
}

final class SendMessageFailure extends SendMessageState {
  final String message;
  SendMessageFailure(this.message);
}

final class SendMessageLoading extends SendMessageState {}
