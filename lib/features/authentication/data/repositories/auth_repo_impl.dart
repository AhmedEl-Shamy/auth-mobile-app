import 'package:auth_mobile_app/core/utils/failure.dart';
import 'package:auth_mobile_app/features/authentication/data/data%20sources/auth_local_data_source.dart';
import 'package:auth_mobile_app/features/authentication/data/data%20sources/auth_remote_data_source.dart';
import 'package:auth_mobile_app/features/authentication/domain/entities/user_entity.dart';
import 'package:auth_mobile_app/features/authentication/domain/repositories/auth_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class AuthRepoImpl extends AuthRepo {
  final AuthRemoteDataSource _authRemoteDataSource;
  final AuthLocalDataSource _authLocalDataSource;

  AuthRepoImpl({
    required AuthRemoteDataSource authRemoteDataSource,
    required AuthLocalDataSource authLocalDataSource,
  })  : _authRemoteDataSource = authRemoteDataSource,
        _authLocalDataSource = authLocalDataSource;

  @override
  Future<Either<Failure, UserEntity>> logIn(Map<String, String> params) async {
    try {
      UserEntity user = await _authRemoteDataSource.logIn(params);
      return right(user);
    } on DioException catch (e) {
      return left(ServerFailure.fromDioException(e));
    }
  }

  @override
  Future<Either<Failure, UserEntity>> logInWithToken(
      Map<String, String> params) async {
    try {
      UserEntity user = await _authRemoteDataSource.logInWithToken(params);
      return right(user);
    } on DioException catch (e) {
      return left(ServerFailure.fromDioException(e));
    }
  }

  @override
  Future<void> logOut() {
    return _authLocalDataSource.deleteUser();
  }

  @override
  Future<Either<Failure, bool>> register(Map<String, String> params) async {
    try {
      await _authRemoteDataSource.register(params);
      return right(true);
    } on DioException catch (e) {
      return left(ServerFailure.fromDioException(e));
    }
  }
  
  @override
  Future<void> storeUserToken(String token) {
    return _authLocalDataSource.storeUserToken(token);
  }
  
  @override
  Future<String?> getStoredToken() {
    return _authLocalDataSource.getUserToken();
  }

}
