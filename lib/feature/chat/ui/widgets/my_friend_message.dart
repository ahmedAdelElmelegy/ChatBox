import 'package:flutter/material.dart';
import 'package:chat_box/core/helpers/spacing.dart';
import 'package:chat_box/core/theme/colors.dart';
import 'package:chat_box/core/theme/styles.dart';
import 'package:chat_box/core/widgets/cached_image.dart';
import 'package:chat_box/data/models/message_model.dart';
import 'package:chat_box/data/models/user_model.dart';
import 'package:chat_box/feature/message/ui/widgets/file_widget.dart';
import 'package:chat_box/feature/message/ui/widgets/user_picture.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl/intl.dart';
import 'package:url_launcher/url_launcher.dart';

class MyFriendMessage extends StatelessWidget {
  final MessageModel msg;
  final UserModel userModel;

  const MyFriendMessage({
    super.key,
    required this.msg,
    required this.userModel,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 30.h),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            UserPicture(image: userModel.image),
            horizontalSpace(12),
            Flexible(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(userModel.name, style: TextSTyles.f14CarosMeduimBlack),
                  verticalSpace(4),
                  if (msg.content.isNotEmpty || msg.imageList!.isNotEmpty)
                    Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: 12.w,
                        vertical: 12.h,
                      ),
                      decoration: BoxDecoration(
                        color: ColorManager.greyLight3,
                        borderRadius: BorderRadius.only(
                          topRight: Radius.circular(16.r),
                          bottomLeft: Radius.circular(16.r),
                          bottomRight: Radius.circular(16.r),
                        ),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          if (msg.imageList!.isNotEmpty)
                            Column(
                              children: [
                                Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: List.generate(
                                    msg.imageList!.length,
                                    (index) => Padding(
                                      padding: EdgeInsets.only(right: 6.w),
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(
                                          8.r,
                                        ),
                                        child: SizedBox(
                                          width: 68.w,
                                          height: 68.h,
                                          child: CachedImage(
                                            image: msg.imageList![index],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                verticalSpace(10),
                              ],
                            ),
                          if (msg.content.isNotEmpty)
                            Text(
                              msg.content,
                              style: TextSTyles.f12CirStdMediumGrey,
                            ),
                        ],
                      ),
                    ),
                  if (msg.pdfUrl != '')
                    Padding(
                      padding: EdgeInsets.only(top: 8.h),
                      child: SelectedFileWidget(
                        fileName: Uri.decodeFull(
                          msg.pdfUrl!
                              .split('chat_pdfs%2F')
                              .last
                              .split('?')
                              .first,
                        ),
                        onTap: () async {
                          final uri = Uri.parse(msg.pdfUrl!);
                          if (await canLaunchUrl(uri)) {
                            await launchUrl(
                              uri,
                              mode: LaunchMode.externalApplication,
                            );
                          } else {
                            Fluttertoast.showToast(
                              msg: 'Could not launch ${msg.pdfUrl}',
                            );
                          }
                        },
                      ),
                    ),
                  verticalSpace(8),
                  Text(
                    DateFormat('hh:mm a').format(msg.timestamp),
                    style: TextSTyles.f10CirStdMediumWhite,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
