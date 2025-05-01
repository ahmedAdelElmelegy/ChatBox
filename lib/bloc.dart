import 'package:chat_box/core/di/injection.dart';
import 'package:chat_box/data/manager/login/login_cubit.dart';
import 'package:chat_box/data/manager/signUp/sign_up_cubit.dart';
import 'package:chat_box/data/manager/story/story_cubit.dart';
import 'package:chat_box/data/manager/user_data/user_data_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class GenrateMultiBloc extends StatelessWidget {
  final Widget child;
  const GenrateMultiBloc({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => getIt<LoginCubit>()),
        BlocProvider(create: (context) => getIt<SignUpCubit>()),
        BlocProvider(
          create: (context) => getIt<UserDataCubit>()..getUserData(),
        ),
        BlocProvider(create: (context) => getIt<StoryCubit>()),
      ],
      child: child,
    );
  }
}
