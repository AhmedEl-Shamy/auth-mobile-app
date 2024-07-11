import 'dart:async';

import 'package:auth_mobile_app/core/usecases/usecase_with_param.dart';
import 'package:auth_mobile_app/features/authentication/domain/repositories/auth_repo.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/utils/failure.dart';

class RegisterUseCase
    extends UseCaseWithParam<Future<Either<Failure, bool>>, Map<String, String>> {
  final AuthRepo _authRepo;

  RegisterUseCase({required AuthRepo authRepo}) : _authRepo = authRepo;
  @override
  Future<Either<Failure, bool>> call(Map<String, String> param) {
    return _authRepo.register(param);
  }
}
