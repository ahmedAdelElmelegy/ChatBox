import 'package:chat_box/core/utils/app_constants.dart';
import 'package:chat_box/data/manager/get_story/get_story_cubit.dart';
import 'package:chat_box/data/manager/user_data/user_data_cubit.dart';
import 'package:chat_box/data/models/story_model.dart';
import 'package:chat_box/feature/message/ui/widgets/story_item.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class StoryListView extends StatefulWidget {
  const StoryListView({super.key});

  @override
  State<StoryListView> createState() => _StoryListViewState();
}

class _StoryListViewState extends State<StoryListView> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      BlocProvider.of<GetStoryCubit>(context).getStory();
      BlocProvider.of<UserDataCubit>(context).getUserData();
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 83.h,
      child: BlocBuilder<GetStoryCubit, GetStoryState>(
        builder: (context, state) {
          final getStoryCubit = GetStoryCubit.get(context);

          // Show error if needed
          if (state is GetStoryFailure) {
            return Center(child: Text(state.message));
          }
          // Show loading indicator
          else if (state is GetStoryLoading ||
              context.watch<UserDataCubit>().state is UserDataLoading) {
            return Center(child: CircularProgressIndicator());
          }

          final stories = getStoryCubit.stories;

          // Always show "My Status" even if stories are empty
          return ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: stories.isEmpty ? 1 : stories.length,
            itemBuilder: (context, index) {
              final story =
                  stories.isEmpty
                      ? StoryModel(
                        id: '',
                        userId: FirebaseAuth.instance.currentUser!.uid,
                        imageUrl:
                            context.read<UserDataCubit>().userModel?.image ??
                            AppConstants
                                .defaultImage, // optional fallback image
                        caption: context.read<UserDataCubit>().userModel!.name,
                        timestamp: DateTime.now(),
                      )
                      : stories[index];

              return Padding(
                padding: EdgeInsets.only(right: 13.w),
                child: StoryItem(storyModel: story),
              );
            },
          );
        },
      ),
    );
  }
}
