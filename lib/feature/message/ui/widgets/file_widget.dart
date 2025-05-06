import 'package:chat_box/core/theme/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SelectedFileWidget extends StatelessWidget {
  final String fileName;
  final VoidCallback onTap;

  const SelectedFileWidget({
    Key? key,
    required this.fileName,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 200.w,
      child: Card(
        color: Colors.grey[100],
        margin: const EdgeInsets.symmetric(vertical: 8),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        child: ListTile(
          onTap: onTap,
          leading: const Icon(Icons.picture_as_pdf, color: Colors.red),
          title: Text(
            fileName,
            style: TextSTyles.f12CirStdMediumGrey,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ),
    );
  }
}
