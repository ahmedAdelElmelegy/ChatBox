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
            if (msg.content.isNotEmpty || (msg.imageList?.isNotEmpty ?? false))
              Container(
                padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 12.h),
                decoration: BoxDecoration(
                  color: ColorManager.secondary,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(16.r),
                    bottomLeft: Radius.circular(16.r),
                    bottomRight: Radius.circular(16.r),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    if (msg.imageList != null && msg.imageList!.isNotEmpty)
                      Column(
                        children: [
                          Wrap(
                            spacing: 8.w,
                            runSpacing: 8.h,
                            children:
                                msg.imageList!.map((imageUrl) {
                                  return ClipRRect(
                                    borderRadius: BorderRadius.circular(8.r),
                                    child: SizedBox(
                                      width: 68.w,
                                      height: 68.h,
                                      child: CachedImage(image: imageUrl),
                                    ),
                                  );
                                }).toList(),
                          ),
                          verticalSpace(10),
                        ],
                      ),
                    if (msg.content.isNotEmpty)
                      Text(msg.content, style: TextSTyles.f12CirStdMediumWhite),
                  ],
                ),
              ),

            if (msg.pdfUrl != null && msg.pdfUrl!.isNotEmpty) ...[
              verticalSpace(8),
              SelectedFileWidget(
                fileName: Uri.decodeFull(
                  msg.pdfUrl!.split('chat_pdfs%2F').last.split('?').first,
                ),
                onTap: () async {
                  final uri = Uri.parse(msg.pdfUrl!);
                  if (await canLaunchUrl(uri)) {
                    await launchUrl(uri, mode: LaunchMode.externalApplication);
                  } else {
                    Fluttertoast.showToast(
                      msg: 'Could not launch ${msg.pdfUrl}',
                    );
                  }
                },
              ),
            ],

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
