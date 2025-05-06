import 'package:chat_box/core/helpers/extentions.dart';
import 'package:chat_box/core/theme/colors.dart';
import 'package:chat_box/core/widgets/loading_widget.dart';
import 'package:chat_box/data/manager/get_all_users/get_all_users_cubit.dart';
import 'package:chat_box/feature/chat/ui/chat_screen.dart';
import 'package:chat_box/feature/message/ui/widgets/user_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class UserListView extends StatelessWidget {
  const UserListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetAllUsersCubit, GetAllUsersState>(
      builder: (context, state) {
        final getAllUsersCubit = GetAllUsersCubit.get(context);
        if (state is GetAllUsersFailure) {
          return Center(child: Text(state.message));
        }
        return Expanded(
          child: ListView.builder(
            itemBuilder:
                (context, index) =>
                    state is GetAllUsersLoading
                        ? LoadingWidget(height: 50.h)
                        : InkWell(
                          splashColor: ColorManager.greylight,
                          onTap: () {
                            push(
                              ChatScreen(
                                userModel: getAllUsersCubit.userModel![index],
                              ),
                            );
                          },
                          child: UserItem(
                            userModel: getAllUsersCubit.userModel![index],
                          ),
                        ),

            itemCount: getAllUsersCubit.userModel!.length,
          ),
        );
      },
    );
  }
}
