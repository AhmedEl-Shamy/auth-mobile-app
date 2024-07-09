import 'package:auth_mobile_app/core/usecases/usecase.dart';
import 'package:auth_mobile_app/features/authentication/domain/entities/user_entity.dart';
import 'package:auth_mobile_app/features/authentication/domain/repositories/auth_repo.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/utils/failure.dart';

class LogInUsecase
    extends UseCase<Future<Either<Failure, UserEntity>>, String> {
  final AuthRepo _authRepo;

  LogInUsecase({required AuthRepo authRepo}) : _authRepo = authRepo;

  @override
  Future<Either<Failure, UserEntity>> call(String param) {
    return _authRepo.logInWithToken(param);
  }
}
