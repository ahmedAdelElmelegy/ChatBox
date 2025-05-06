import 'package:chat_box/core/helpers/spacing.dart';
import 'package:chat_box/core/theme/colors.dart';
import 'package:chat_box/core/theme/styles.dart';
import 'package:chat_box/core/widgets/cached_image.dart';
import 'package:chat_box/data/models/message_model.dart';
import 'package:chat_box/feature/message/ui/widgets/file_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl/intl.dart';
import 'package:url_launcher/url_launcher.dart';

class MyMessage extends StatelessWidget {
  final MessageModel msg;
  const MyMessage({super.key, required this.msg});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 30.h),
      child: Align(
        alignment: Alignment.centerRight,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            msg.content != ''
                ? Container(
                  // margin: EdgeInsets.only(bottom: 30.h),
                  padding: EdgeInsets.symmetric(
                    horizontal: 12.w,
                    vertical: 12.h,
                  ),
                  decoration: BoxDecoration(
                    color: ColorManager.secondary,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(16.r),
                      bottomLeft: Radius.circular(16.r),
                      bottomRight: Radius.circular(16.r),
                    ),
                  ),
                  child: Text(
                    msg.content,
                    style: TextSTyles.f12CirStdMediumWhite,
                  ),
                )
                : SizedBox.shrink(),
            verticalSpace(8),
            msg.pdfUrl != ''
                ? SelectedFileWidget(
                  fileName: Uri.decodeFull(
                    msg.pdfUrl!.split('chat_pdfs%2F').last.split('?').first,
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
                )
                : SizedBox.shrink(),

            msg.imageList!.isNotEmpty
                ? Container(
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  padding: EdgeInsets.all(8.w),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.r),

                    color: ColorManager.secondary,
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: List.generate(
                      msg.imageList!.length,
                      (index) => Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.r),
                        ),
                        width: 68.w,
                        height: 68.h,

                        child: CachedImage(image: msg.imageList![index]),
                      ),
                    ),
                  ),
                )
                : SizedBox.shrink(),
            verticalSpace(8),
            Text(
              DateFormat('hh:mm a').format(msg.timestamp),
              style: TextSTyles.f10CirStdMediumWhite,
            ),
          ],
        ),
      ),
    );
  }
}
