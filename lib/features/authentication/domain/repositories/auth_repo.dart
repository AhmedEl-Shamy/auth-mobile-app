import 'package:auth_mobile_app/features/authentication/domain/entities/user_entity.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/utils/failure.dart';

abstract class AuthRepo {
  Future<Either<Failure, UserEntity>> logIn(Map<String, String> params);
  Future<void> storeUserToken(String token);
  Future<String?> getStoredToken();
  Future<Either<Failure, bool>> register(Map<String, String> params);
  Future<Either<Failure, UserEntity>> logInWithToken(Map<String, String> params);
  Future<void> logOut();
}
