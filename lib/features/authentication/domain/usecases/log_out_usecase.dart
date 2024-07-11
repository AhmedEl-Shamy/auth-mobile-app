import 'package:auth_mobile_app/core/usecases/usecase.dart';
import 'package:auth_mobile_app/features/authentication/domain/repositories/auth_repo.dart';

class LogOutUsecase extends UseCase<Future<void>> {
  final AuthRepo _authRepo;

  LogOutUsecase({required AuthRepo authRepo}) : _authRepo = authRepo;

  @override
  Future<void> call() {
    return _authRepo.logOut();
  }
}
