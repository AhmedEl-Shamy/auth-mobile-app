import 'package:auth_mobile_app/core/usecases/usecase.dart';
import 'package:auth_mobile_app/features/authentication/domain/repositories/auth_repo.dart';

class LogInUsecase extends UseCase<Future<void>, void> {
  final AuthRepo _authRepo;

  LogInUsecase({required AuthRepo authRepo}) : _authRepo = authRepo;
  
  @override
  Future<void> call(void param) {
    return _authRepo.logOut();
  }
  

  
  
}