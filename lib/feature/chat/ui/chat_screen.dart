import 'dart:io';

import 'package:chat_box/core/helpers/spacing.dart';
import 'package:chat_box/core/theme/styles.dart';
import 'package:chat_box/data/manager/get_chat/get_chat_cubit.dart';
import 'package:chat_box/data/manager/send_message/send_message_cubit.dart';
import 'package:chat_box/data/models/message_model.dart';
import 'package:chat_box/data/models/user_model.dart';

import 'package:chat_box/feature/chat/ui/widgets/chat_appbar.dart';

import 'package:chat_box/feature/chat/ui/widgets/enter_message_widget.dart';
import 'package:chat_box/feature/chat/ui/widgets/my_friend_message.dart';
import 'package:chat_box/feature/chat/ui/widgets/my_message.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ChatScreen extends StatefulWidget {
  final UserModel userModel;
  const ChatScreen({super.key, required this.userModel});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      BlocProvider.of<GetChatCubit>(context).getChat(widget.userModel.uid);
      _scrollController = ScrollController();
    });
    super.initState();
  }

  late ScrollController _scrollController;

  @override
  Widget build(BuildContext context) {
    final selectedImages = context.watch<SendMessageCubit>().images;
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.w),
          child: Column(
            children: [
              verticalSpace(16),
              ChatAppBar(userModel: widget.userModel),
              BlocBuilder<GetChatCubit, GetChatState>(
                builder: (context, state) {
                  final cubit = GetChatCubit.get(context);

                  if (state is GetChatFailure) return Text(state.message);
                  if (state is GetChatLoading) {
                    return const Expanded(
                      child: Center(child: CircularProgressIndicator()),
                    );
                  }

                  return Expanded(
                    child: StreamBuilder<List<MessageModel>>(
                      stream: cubit.messages,
                      builder: (context, snapshot) {
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return const Center(
                            child: CircularProgressIndicator(),
                          );
                        }

                        if (snapshot.hasError) {
                          return Center(
                            child: Text('Error: ${snapshot.error}'),
                          );
                        }
                        WidgetsBinding.instance.addPostFrameCallback((_) {
                          if (_scrollController.hasClients) {
                            _scrollController.jumpTo(
                              _scrollController.position.maxScrollExtent,
                            );
                          }
                        });
                        final messages = snapshot.data ?? [];

                        if (messages.isEmpty) {
                          return const Center(child: Text('No messages yet'));
                        }

                        return ListView.builder(
                          controller: _scrollController,
                          itemCount: messages.length,
                          itemBuilder: (context, index) {
                            final msg = messages[index];
                            final isMe =
                                msg.senderId ==
                                FirebaseAuth.instance.currentUser?.uid;
                            if (index == messages.length - 1) {
                              WidgetsBinding.instance.addPostFrameCallback((_) {
                                _scrollController.animateTo(
                                  _scrollController.position.maxScrollExtent,
                                  duration: const Duration(milliseconds: 300),
                                  curve: Curves.easeOut,
                                );
                              });
                            }
                            return isMe
                                ? MyMessage(msg: msg)
                                : MyFriendMessage(
                                  msg: msg,
                                  userModel: widget.userModel,
                                );
                          },
                        );
                      },
                    ),
                  );
                },
              ),

              context.watch<SendMessageCubit>().pdfUrl.isNotEmpty
                  ? Row(
                    children: [
                      Icon(Icons.picture_as_pdf, color: Colors.red),
                      SizedBox(width: 8),
                      Expanded(
                        child: Text(
                          Uri.decodeFull(
                            context
                                .read<SendMessageCubit>()
                                .pdfUrl
                                .split('chat_pdfs%2F')
                                .last
                                .split('?')
                                .first,
                          ),
                          style: TextSTyles.f12CirStdMediumGrey,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      IconButton(
                        icon: Icon(Icons.clear, color: Colors.grey),
                        onPressed: () {
                          context.read<SendMessageCubit>().pdfUrl = '';
                          // context.read<SendMessageCubit>().emit(ImageCleared());
                        },
                      ),
                    ],
                  )
                  : SizedBox.shrink(),
              selectedImages.isNotEmpty
                  ? SizedBox(
                    height: 100.h,
                    child: ListView.separated(
                      scrollDirection: Axis.horizontal,
                      itemCount: selectedImages.length,
                      separatorBuilder: (_, __) => SizedBox(width: 8.w),
                      itemBuilder: (context, index) {
                        return Stack(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(12.r),
                              child: Image.file(
                                File(selectedImages[index].path),
                                width: 100.h,
                                height: 100.h,
                                fit: BoxFit.cover,
                              ),
                            ),
                            Positioned(
                              top: 4,
                              right: 4,
                              child: GestureDetector(
                                onTap: () {
                                  selectedImages.removeAt(index);
                                },
                                child: CircleAvatar(
                                  backgroundColor: Colors.red,
                                  radius: 12,
                                  child: Icon(
                                    Icons.clear,
                                    size: 14,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        );
                      },
                    ),
                  )
                  : const SizedBox.shrink(),
              EnterMessageWidget(
                scrollToBottom:
                    () => _scrollController.animateTo(
                      _scrollController.position.maxScrollExtent,
                      duration: const Duration(milliseconds: 300),
                      curve: Curves.easeOut,
                    ),

                userModel: widget.userModel,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
