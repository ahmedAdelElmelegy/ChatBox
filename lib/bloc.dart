import 'package:chat_box/core/di/injection.dart';
import 'package:chat_box/data/manager/cubit/login_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class GenrateMultiBloc extends StatelessWidget {
  final Widget child;
  const GenrateMultiBloc({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [BlocProvider(create: (context) => getIt<LoginCubit>())],
      child: child,
    );
  }
}
