import 'package:chat_box/core/helpers/constants.dart';
import 'package:chat_box/core/helpers/extentions.dart';
import 'package:chat_box/core/helpers/spacing.dart';
import 'package:chat_box/core/theme/colors.dart';
import 'package:chat_box/core/theme/styles.dart';
import 'package:chat_box/core/widgets/svg_icon.dart';
import 'package:chat_box/data/manager/get_chat/get_chat_cubit.dart';
import 'package:chat_box/data/models/user_model.dart';
import 'package:chat_box/feature/message/ui/widgets/user_picture.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ChatAppBar extends StatelessWidget {
  final UserModel userModel;
  const ChatAppBar({super.key, required this.userModel});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        GestureDetector(
          onTap: () => pop(),
          child: SvgIcon(
            icon: Assets.back,
            color: ColorManager.black,
            width: 24.w,
            height: 24.h,
          ),
        ),
        horizontalSpace(12),
        UserPicture(image: userModel.image),
        horizontalSpace(12),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(userModel.name, style: TextSTyles.f16CarosMediumBlack),
            verticalSpace(6),
            BlocBuilder<GetChatCubit, GetChatState>(
              builder: (context, state) {
                // final cubit = GetChatCubit.get(context);
                // final user = FirebaseAuth.instance.currentUser;

                if (state is GetChatFailure) return Text(state.message);
                return Text('', style: TextSTyles.f12CirStdMediumGrey);
              },
            ),
          ],
        ),
        Spacer(),
        Row(
          children: [
            SvgIcon(icon: Assets.iconsCall),
            horizontalSpace(16),
            SvgIcon(icon: Assets.iconsVideo),
          ],
        ),
      ],
    );
  }

  // String _getChatId(String user1, String user2) {
  //   final sorted = [user1, user2]..sort();
  //   return '${sorted[0]}_${sorted[1]}';
  // }
}
