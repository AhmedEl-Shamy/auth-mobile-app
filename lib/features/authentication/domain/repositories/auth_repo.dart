import 'package:auth_mobile_app/features/authentication/domain/entities/user_entity.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/utils/Failure.dart';

abstract class AuthRepo {
  Future<Either<Failure, UserEntity>> logIn(String username, String password);
  Future<Either<Failure, UserEntity>> register(String username, String password);
  Future<Either<Failure, UserEntity>> logInWithToken(String token);
}