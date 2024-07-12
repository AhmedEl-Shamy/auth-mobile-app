import 'package:auth_mobile_app/core/usecases/usecase_with_param.dart';
import 'package:auth_mobile_app/features/authentication/domain/repositories/auth_repo.dart';

class StoreUserTokenUseCase extends UseCaseWithParam<Future<void>, String> {
  final AuthRepo _authRepo;

  StoreUserTokenUseCase({required AuthRepo authRepo}) : _authRepo = authRepo;
  @override
  Future<void> call(String param) {
    return _authRepo.storeUserToken(param);
  }
}