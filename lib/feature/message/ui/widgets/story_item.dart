import 'dart:io';

import 'package:chat_box/core/helpers/constants.dart';
import 'package:chat_box/core/helpers/extentions.dart';
import 'package:chat_box/core/helpers/spacing.dart';
import 'package:chat_box/core/theme/colors.dart';
import 'package:chat_box/core/theme/styles.dart';
import 'package:chat_box/core/widgets/cached_image.dart';
import 'package:chat_box/data/manager/add_story/story_cubit.dart';
import 'package:chat_box/data/models/story_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';

class StoryItem extends StatefulWidget {
  final StoryModel storyModel;
  const StoryItem({super.key, required this.storyModel});

  @override
  State<StoryItem> createState() => _StoryItemState();
}

class _StoryItemState extends State<StoryItem> {
  XFile? selectedImage;
  @override
  Widget build(BuildContext context) {
    final bloc = StoryCubit.get(context);
    return GestureDetector(
      onTap: () async {
        showImagePickerOptions(context);
      },
      child: Column(
        children: [
          Stack(
            alignment: Alignment.bottomRight,
            children: [
              selectedImage == null
                  ? SizedBox(
                    width: 58.w,
                    height: 58.h,
                    child: CircleAvatar(
                      radius: 29.r,
                      backgroundColor: Colors.transparent,
                      backgroundImage: AssetImage(Assets.myStoryBag),
                      child: CircleAvatar(
                        radius: 28.r,
                        backgroundColor: ColorManager.black,

                        child: Container(
                          width: 52.r,
                          height: 52.r,
                          clipBehavior: Clip.antiAliasWithSaveLayer,
                          decoration: BoxDecoration(shape: BoxShape.circle),
                          child: CachedImage(
                            image: widget.storyModel.imageUrl,
                            boxFit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                  )
                  : Container(
                    width: 58.w,
                    height: 58.h,
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                    decoration: BoxDecoration(shape: BoxShape.circle),
                    child: Image.file(
                      File(selectedImage!.path),
                      fit: BoxFit.cover,
                    ),
                  ),
              CircleAvatar(
                radius: 8.r,
                backgroundColor: ColorManager.white,
                child:
                    selectedImage == null
                        ? Icon(
                          Icons.add,
                          size: 10.sp,
                          color: ColorManager.black,
                        )
                        : GestureDetector(
                          onTap: () async {
                            await bloc.uploadStoryWithImage(
                              FirebaseAuth.instance.currentUser!.uid,
                              File(selectedImage!.path),
                            );
                            selectedImage = null;
                            setState(() {});
                          },
                          child: Icon(
                            Icons.check,
                            size: 10.sp,
                            color: ColorManager.black,
                          ),
                        ),
              ),
            ],
          ),

          verticalSpace(10),
          Text('My status', style: TextSTyles.f14CarosRegularwhite),
        ],
      ),
    );
  }

  void showImagePickerOptions(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Container(
          height: 150.h,
          color: Colors.transparent,
          child: Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                GestureDetector(
                  onTap: () async {
                    await selectImage(ImageSource.camera);
                    pop();
                  },
                  child: Column(
                    children: [
                      verticalSpace(16),
                      Icon(
                        Icons.camera_alt_outlined,
                        color: ColorManager.red,
                        size: 24.sp,
                      ),
                      Text('take Photo', style: TextSTyles.f14CarosMeduimBlack),
                      verticalSpace(16),
                    ],
                  ),
                ),
                GestureDetector(
                  onTap: () async {
                    await selectImage(ImageSource.gallery);
                    pop();
                  },
                  child: Column(
                    children: [
                      verticalSpace(16),
                      Icon(
                        Icons.photo_outlined,
                        color: ColorManager.red,
                        size: 24.sp,
                      ),
                      Text(
                        'select photo',
                        style: TextSTyles.f14CarosMeduimBlack,
                      ),
                      verticalSpace(16),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Future selectImage(ImageSource source) async {
    var image = await ImagePicker().pickImage(source: source);
    setState(() {
      selectedImage = image;
    });
    // widget.onImageSelected(selectedImage!);
  }
}
