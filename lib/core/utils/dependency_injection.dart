import 'package:auth_mobile_app/core/services/api_service.dart';
import 'package:auth_mobile_app/core/services/secured_storage_service.dart';
import 'package:auth_mobile_app/features/authentication/data/data%20sources/auth_local_data_source.dart';
import 'package:auth_mobile_app/features/authentication/data/data%20sources/auth_remote_data_source.dart';
import 'package:auth_mobile_app/features/authentication/data/repositories/auth_repo_impl.dart';
import 'package:auth_mobile_app/features/authentication/domain/repositories/auth_repo.dart';
import 'package:auth_mobile_app/features/authentication/domain/usecases/log_in_usecase.dart';
import 'package:auth_mobile_app/features/authentication/domain/usecases/log_in_with_token_usecase.dart';
import 'package:auth_mobile_app/features/authentication/domain/usecases/log_out_usecase.dart';
import 'package:auth_mobile_app/features/authentication/domain/usecases/register_usecase.dart';
import 'package:auth_mobile_app/features/authentication/domain/usecases/remember_user_usecase.dart';
import 'package:auth_mobile_app/features/authentication/presentation/controllers/log_in_out_cubit/log_in_out_cubit.dart';
import 'package:auth_mobile_app/features/authentication/presentation/controllers/register_cubit/register_cubit.dart';
import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get_it/get_it.dart';

final GetIt sl = GetIt.I;

void setupLocator() {
  // ===================== Services  ===================== //

  sl.registerSingleton<Dio>(Dio());
  sl.registerSingleton<FlutterSecureStorage>(
    const FlutterSecureStorage(
        aOptions: AndroidOptions(
      encryptedSharedPreferences: true,
    )),
  );
  sl.registerSingleton<ApiService>(
    ApiServiceImpl(
      dio: sl.get<Dio>(),
    ),
  );
  sl.registerSingleton<SecuredStorageService>(
    SecuredStorageServiceImpl(
      secureStorage: sl.get<FlutterSecureStorage>(),
    ),
  );

  // ============================= Data Sources =============================//

  sl.registerSingleton<AuthRemoteDataSource>(
    AuthRemoteDataSourceImpl(apiService: sl.get<ApiService>()),
  );
  sl.registerSingleton<AuthLocalDataSource>(
    AuthLocalDataSourceImpl(
      securedStorageService: sl.get<SecuredStorageService>(),
    ),
  );

  // ====================== Repositories ====================== //

  sl.registerSingleton<AuthRepo>(
    AuthRepoImpl(
      authRemoteDataSource: sl.get<AuthRemoteDataSource>(),
      authLocalDataSource: sl.get<AuthLocalDataSource>(),
    ),
  );

  // ====================== usecases ====================== //

  sl.registerSingleton<LogInUseCase>(
    LogInUseCase(
      authRepo: sl.get<AuthRepo>(),
    ),
  );
  sl.registerSingleton<LogOutUseCase>(
    LogOutUseCase(
      authRepo: sl.get<AuthRepo>(),
    ),
  );
  sl.registerSingleton<LogInWithTokenUseCase>(
    LogInWithTokenUseCase(
      authRepo: sl.get<AuthRepo>(),
    ),
  );
  sl.registerSingleton<RegisterUseCase>(
    RegisterUseCase(
      authRepo: sl.get<AuthRepo>(),
    ),
  );
  sl.registerSingleton<RememberUserUseCase>(
    RememberUserUseCase(
      authRepo: sl.get<AuthRepo>(),
    ),
  );

  // ====================== Cubits ====================== //

  sl.registerFactory<LogInOutCubit>(
    () => LogInOutCubit(
      rememberUserUsecase: sl.get<RememberUserUseCase>(),
      logInUsecase: sl.get<LogInUseCase>(),
      logInWithTokenUseCase: sl.get<LogInWithTokenUseCase>(),
      logOutUsecase: sl.get<LogOutUseCase>(),
    ),
  );

  sl.registerFactory<RegisterCubit>(
    () => RegisterCubit(
      registerUseCase: sl.get<RegisterUseCase>(),
    ),
  );
}
