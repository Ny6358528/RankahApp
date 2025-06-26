import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:rankah/core/api/dio_consumer.dart';
import 'package:rankah/core/cache/cache_helper.dart';
import 'package:rankah/core/network/dio_helper.dart';
import 'package:rankah/feature/authentication/data/repo/authRepo.dart';
import 'package:rankah/feature/authentication/data/repo/authRepoImp.dart';
import 'package:rankah/feature/authentication/data/repo/forgot_password_repository.dart';
import 'package:rankah/feature/authentication/logic/cubit/forget_password_cubit.dart';
import 'package:rankah/feature/authentication/logic/cubit/login_cubit.dart';
import 'package:rankah/feature/authentication/logic/cubit/sign_up_cubit.dart';
import 'package:rankah/feature/profile/data/profile_repo.dart';
import 'package:rankah/feature/profile/logic/cubit/profile_cubit.dart';
import 'package:rankah/feature/history/logic/cubit/history_cubit.dart';
import 'package:rankah/feature/reservation/logic/cubit/reservation_cubit.dart';

final GetIt getIt = GetIt.instance;
final sl = getIt;

Future<void> init() async {
  // Local Cache
  final cacheHelper = CacheHelper();
  await cacheHelper.init();
  getIt.registerLazySingleton<CacheHelper>(() => cacheHelper);

  // Initialize Dio + Auth Interceptor
  await DioHelper.init();
  getIt.registerLazySingleton<Dio>(() => DioHelper.dio);

  //  Dio Consumer
  getIt.registerLazySingleton<DioConsumer>(() => DioConsumer(dio: getIt<Dio>()));

  // Repositories
  getIt.registerLazySingleton<AuthRepo>(() => AuthRepoImp(apiConsumer: getIt<DioConsumer>()));
  getIt.registerLazySingleton<ProfileRepository>(() => ProfileRepository(api: getIt<DioConsumer>()));

  // Cubits
  getIt.registerFactory(() => SignUpCubit(authRepo: getIt<AuthRepo>()));
  getIt.registerFactory(() => LoginCubit(authRepo: getIt<AuthRepo>()));

getIt.registerLazySingleton<ForgotPasswordRepository>(() => ForgotPasswordRepository(getIt<Dio>()));
getIt.registerFactory(() => ForgotPasswordCubit(getIt<ForgotPasswordRepository>()));
  getIt.registerFactory(() => ProfileCubit(repository: getIt<ProfileRepository>()));
  getIt.registerFactory(() => HistoryCubit());
  getIt.registerFactory(() => ReservationCubit());
}
