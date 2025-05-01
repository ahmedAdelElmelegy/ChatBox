import 'package:chat_box/core/theme/styles.dart';
import 'package:chat_box/data/manager/user_data/user_data_cubit.dart';

import 'package:chat_box/feature/message/ui/widgets/search_icon.dart';
import 'package:chat_box/feature/message/ui/widgets/user_picture.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeAppBar extends StatelessWidget {
  const HomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserDataCubit, UserDataState>(
      builder: (context, state) {
        if (state is UserDataLoading) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is UserDataFailure) {
          return Center(child: Text(state.message));
        }
        final cubit = UserDataCubit.get(context);
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            BorderIcon(),
            Text('Home', style: TextSTyles.f20CarosboldWhite),
            UserPicture(image: cubit.userModel!.image),
          ],
        );
      },
    );
  }
}
