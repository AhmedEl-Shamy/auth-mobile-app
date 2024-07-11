import 'package:auth_mobile_app/core/usecases/usecase.dart';
import 'package:auth_mobile_app/features/authentication/domain/repositories/auth_repo.dart';

class LogOutUseCase extends UseCase<Future<void>> {
  final AuthRepo _authRepo;

  LogOutUseCase({required AuthRepo authRepo}) : _authRepo = authRepo;

  @override
  Future<void> call() {
    return _authRepo.logOut();
  }
}
