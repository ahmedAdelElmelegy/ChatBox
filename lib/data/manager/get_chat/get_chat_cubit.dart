import 'package:chat_box/data/models/message_model.dart';
import 'package:chat_box/data/repo/chat_repo.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'get_chat_state.dart';

class GetChatCubit extends Cubit<GetChatState> {
  GetChatCubit(this.getChatRepo) : super(GetChatInitial());
  static GetChatCubit get(context) => BlocProvider.of(context);
  final auth = FirebaseAuth.instance;
  ChatRepo getChatRepo;
  Stream<List<MessageModel>>? messages;
  void getChat(String receiverId) async {
    emit(GetChatLoading());
    final result = await getChatRepo.getMessages(
      auth.currentUser!.uid,
      receiverId,
    );
    result.fold(
      (failure) {
        emit(GetChatFailure(failure.message));
      },
      (messages) {
        this.messages = messages;
        emit(GetChatSucess());
      },
    );
  }

  // void setTyping(String chatId, String userId, bool isTyping) {
  //   getChatRepo.setTypingStatus(chatId, userId, isTyping);
  // }

  // Stream<bool> isUserTyping(String chatId, String userId) {
  //   return getChatRepo.isUserTyping(chatId, userId);
  // }
}
