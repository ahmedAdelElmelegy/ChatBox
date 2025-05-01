import 'package:chat_box/data/manager/cubit/login_cubit.dart';
import 'package:chat_box/data/repo/login_repo.dart';
import 'package:chat_box/data/services/firebase_services.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;
void init() {
  getIt.registerLazySingleton(() => FirebaseServices());
  getIt.registerLazySingleton<LoginRepo>(() => LoginRepo(getIt()));
  getIt.registerLazySingleton<LoginCubit>(() => LoginCubit(getIt()));
}
