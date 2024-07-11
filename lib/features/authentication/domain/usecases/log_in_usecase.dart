import 'dart:async';

import 'package:auth_mobile_app/core/usecases/usecase_with_param.dart';
import 'package:auth_mobile_app/features/authentication/domain/entities/user_entity.dart';
import 'package:auth_mobile_app/features/authentication/domain/repositories/auth_repo.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/utils/failure.dart';

class LogInUseCase
    extends UseCaseWithParam<Future<Either<Failure, UserEntity>>, Map<String, String>> {
  final AuthRepo _authRepo;

  LogInUseCase({required AuthRepo authRepo}) : _authRepo = authRepo;
  @override
  Future<Either<Failure, UserEntity>> call(Map<String, String> param) {
    return _authRepo.logIn(param);
  }
}
