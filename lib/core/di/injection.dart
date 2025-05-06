import 'package:chat_box/data/manager/get_all_users/get_all_users_cubit.dart';
import 'package:chat_box/data/manager/get_chat/get_chat_cubit.dart';
import 'package:chat_box/data/manager/get_story/get_story_cubit.dart';
import 'package:chat_box/data/manager/login/login_cubit.dart';
import 'package:chat_box/data/manager/send_message/send_message_cubit.dart';
import 'package:chat_box/data/manager/signUp/sign_up_cubit.dart';
import 'package:chat_box/data/manager/add_story/story_cubit.dart';
import 'package:chat_box/data/manager/user_data/user_data_cubit.dart';
import 'package:chat_box/data/repo/chat_repo.dart';
import 'package:chat_box/data/repo/create_user_repo.dart';
import 'package:chat_box/data/repo/get_all_user.dart';
import 'package:chat_box/data/repo/get_chat_repo.dart';
import 'package:chat_box/data/repo/get_story_repo.dart';
import 'package:chat_box/data/repo/get_user_data_repo.dart';
import 'package:chat_box/data/repo/login_repo.dart';
import 'package:chat_box/data/repo/sign_up_repo.dart';
import 'package:chat_box/data/repo/story_repo.dart';
import 'package:chat_box/data/services/chat_services.dart';
import 'package:chat_box/data/services/firebase_services.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;
void init() {
  getIt.registerLazySingleton(() => FirebaseServices());
  getIt.registerLazySingleton(() => ChatServices());

  // repo
  getIt.registerLazySingleton<LoginRepo>(() => LoginRepo(getIt()));
  getIt.registerLazySingleton<SignUpRepo>(() => SignUpRepo(getIt()));
  getIt.registerLazySingleton<CreateUserRepo>(() => CreateUserRepo(getIt()));
  getIt.registerLazySingleton<GetUserDataRepo>(() => GetUserDataRepo(getIt()));
  getIt.registerLazySingleton<StoryRepo>(() => StoryRepo(getIt()));
  getIt.registerLazySingleton<GetStoryRepo>(() => GetStoryRepo(getIt()));
  getIt.registerLazySingleton<ChatRepo>(() => ChatRepo(getIt()));
  getIt.registerLazySingleton<GetAllUserRepo>(() => GetAllUserRepo(getIt()));
  getIt.registerLazySingleton<GetChatRepo>(() => GetChatRepo(getIt()));
  // cubit
  getIt.registerLazySingleton<LoginCubit>(() => LoginCubit(getIt()));

  getIt.registerLazySingleton<SignUpCubit>(() => SignUpCubit(getIt(), getIt()));
  getIt.registerLazySingleton<UserDataCubit>(() => UserDataCubit(getIt()));
  getIt.registerLazySingleton<StoryCubit>(() => StoryCubit(getIt()));
  getIt.registerLazySingleton<GetStoryCubit>(() => GetStoryCubit(getIt()));
  getIt.registerLazySingleton<SendMessageCubit>(
    () => SendMessageCubit(getIt()),
  );
  getIt.registerLazySingleton<GetAllUsersCubit>(
    () => GetAllUsersCubit(getIt()),
  );
  getIt.registerLazySingleton<GetChatCubit>(() => GetChatCubit(getIt()));
}
