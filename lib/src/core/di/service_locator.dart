import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_it/get_it.dart';

import '../../features/auth/data/datasources/auth_remote_data_source.dart';
import '../../features/auth/data/repositories/auth_repository_impl.dart';
import '../../features/auth/domain/repositories/auth_repository.dart';
import '../../features/auth/domain/usecases/login_usecase.dart';
import '../../features/auth/domain/usecases/register_usecase.dart';
import '../../features/auth/domain/usecases/reset_password_usecase.dart';
import '../../features/auth/domain/usecases/sign_out_usecase.dart';
import '../../features/auth/presentation/cubit/forgot_password_cubit.dart';
import '../../features/auth/presentation/cubit/login_cubit.dart';
import '../../features/auth/presentation/cubit/register_cubit.dart';
import '../../features/banners/data/datasources/banners_remote_data_source.dart';
import '../../features/banners/data/repositories/banners_repository_impl.dart';
import '../../features/banners/domain/repositories/banners_repository.dart';
import '../../features/banners/domain/usecases/watch_banners_usecase.dart';
import '../../features/banners/presentation/cubit/banners_cubit.dart';
import '../../features/opportunities/data/datasources/opportunities_remote_data_source.dart';
import '../../features/opportunities/data/repositories/opportunities_repository_impl.dart';
import '../../features/opportunities/domain/repositories/opportunities_repository.dart';
import '../../features/opportunities/domain/usecases/watch_opportunities_usecase.dart';
import '../../features/opportunities/presentation/cubit/opportunities_cubit.dart';
import '../../features/profile/presentation/cubit/profile_cubit.dart';

final sl = GetIt.instance;

void setupServiceLocator() {
  sl.registerLazySingleton<FirebaseAuth>(() => FirebaseAuth.instance);
  sl.registerLazySingleton<FirebaseFirestore>(() => FirebaseFirestore.instance);

  sl.registerLazySingleton<AuthRemoteDataSource>(
    () => AuthRemoteDataSourceImpl(
      firebaseAuth: sl(),
      firestore: sl(),
    ),
  );

  sl.registerLazySingleton<AuthRepository>(
    () => AuthRepositoryImpl(sl()),
  );

  sl.registerLazySingleton(() => LoginUseCase(sl()));
  sl.registerLazySingleton(() => RegisterUseCase(sl()));
  sl.registerLazySingleton(() => ResetPasswordUseCase(sl()));
  sl.registerLazySingleton(() => SignOutUseCase(sl()));

  sl.registerFactory(() => LoginCubit(sl()));
  sl.registerFactory(() => RegisterCubit(sl()));
  sl.registerFactory(() => ForgotPasswordCubit(sl()));
  sl.registerFactory(() => ProfileCubit(sl()));

  sl.registerLazySingleton<OpportunitiesRemoteDataSource>(
    () => OpportunitiesRemoteDataSourceImpl(sl()),
  );

  sl.registerLazySingleton<OpportunitiesRepository>(
    () => OpportunitiesRepositoryImpl(sl()),
  );

  sl.registerLazySingleton(() => WatchOpportunitiesUseCase(sl()));
  sl.registerFactory(() => OpportunitiesCubit(sl()));

  sl.registerLazySingleton<BannersRemoteDataSource>(
    () => BannersRemoteDataSourceImpl(sl()),
  );

  sl.registerLazySingleton<BannersRepository>(
    () => BannersRepositoryImpl(sl()),
  );

  sl.registerLazySingleton(() => WatchBannersUseCase(sl()));
  sl.registerFactory(() => BannersCubit(sl()));
}