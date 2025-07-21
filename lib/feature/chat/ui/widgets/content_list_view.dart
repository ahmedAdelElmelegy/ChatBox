import 'package:chat_box/core/helpers/constants.dart';
import 'package:chat_box/core/theme/colors.dart';
import 'package:chat_box/data/manager/send_message/send_message_cubit.dart';
import 'package:chat_box/data/models/content_model.dart';
import 'package:chat_box/feature/chat/ui/widgets/content_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';

class ContentListView extends StatefulWidget {
  const ContentListView({super.key});

  @override
  State<ContentListView> createState() => _ContentListViewState();
}

class _ContentListViewState extends State<ContentListView> {
  XFile? selectedImage;

  @override
  Widget build(BuildContext context) {
    final List<ContentModel> contentItems = [
      ContentModel(
        title: 'Camera',
        subtitle: '',
        icon: Assets.iconsCamera,
        onPress:
            () => context.read<SendMessageCubit>().selectImage(
              ImageSource.camera,
            ),
      ),
      ContentModel(
        title: 'Documents',
        subtitle: 'Share your files',
        icon: Assets.iconsDoc,
        onPress: () {
          context.read<SendMessageCubit>().pickPdf();
        },
      ),
      ContentModel(
        title: 'Media',
        subtitle: 'Share photos and videos',
        icon: Assets.iconsMedia,
        onPress: () => context.read<SendMessageCubit>().selectImages(),
      ),
      ContentModel(
        title: 'Contact',
        subtitle: 'Share your contacts',
        icon: Assets.iconsUser,
      ),
      ContentModel(
        title: 'Location',
        subtitle: 'Share your location',
        icon: Assets.iconsLocation,
        onPress: () {
          // push(VoiceMessageScreen());
        },
      ),
    ];

    return BlocBuilder<SendMessageCubit, SendMessageState>(
      builder: (context, state) {
        if (state is SendPdfLoading) {
          return const Center(child: CircularProgressIndicator());
        }
        return ListView.separated(
          separatorBuilder:
              (context, index) =>
                  Divider(thickness: 1.h, color: ColorManager.greylight),
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: contentItems.length,
          itemBuilder:
              (context, index) => Padding(
                padding: EdgeInsets.symmetric(vertical: 10.h),
                child: ContentItem(contentModel: contentItems[index]),
              ),
        );
      },
    );
  }
}
