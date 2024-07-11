import 'package:auth_mobile_app/core/usecases/usecase_with_param.dart';
import 'package:auth_mobile_app/features/authentication/domain/entities/user_entity.dart';
import 'package:auth_mobile_app/features/authentication/domain/repositories/auth_repo.dart';

class RememberUserUsecase extends UseCaseWithParam<Future<void>, UserEntity> {
  final AuthRepo _authRepo;

  RememberUserUsecase({required AuthRepo authRepo}) : _authRepo = authRepo;
  @override
  Future<void> call(UserEntity param) {
    return _authRepo.rememberUser(param);
  }
}