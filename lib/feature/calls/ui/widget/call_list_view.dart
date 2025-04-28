import 'package:chat_box/core/theme/colors.dart';
import 'package:chat_box/feature/calls/ui/widget/call_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CallListView extends StatelessWidget {
  const CallListView({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.separated(
        itemBuilder:
            (context, index) => Padding(
              padding: EdgeInsets.only(bottom: 10.h, top: 10.h),
              child: const CallItem(),
            ),

        separatorBuilder:
            (context, index) =>
                Divider(color: ColorManager.greylight, thickness: 1.h),
        itemCount: 10,
      ),
    );
  }
}
