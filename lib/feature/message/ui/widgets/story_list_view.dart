import 'package:chat_box/core/widgets/loading_widget.dart';
import 'package:chat_box/data/manager/get_story/get_story_cubit.dart';
import 'package:chat_box/feature/message/ui/widgets/story_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class StoryListView extends StatelessWidget {
  const StoryListView({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 83.h,
      child: BlocBuilder<GetStoryCubit, GetStoryState>(
        builder: (context, state) {
          final getStoryCubit = GetStoryCubit.get(context);
          if (state is GetStoryFailure) return Text(state.message);

          return ListView.builder(
            scrollDirection: Axis.horizontal,
            itemBuilder:
                (context, index) => Padding(
                  padding: EdgeInsets.only(right: 13.w),
                  child:
                      state is GetStoryLoading
                          ? LoadingWidget()
                          : StoryItem(storyModel: getStoryCubit.stories[index]),
                ),
            itemCount: getStoryCubit.stories.length,
          );
        },
      ),
    );
  }
}
