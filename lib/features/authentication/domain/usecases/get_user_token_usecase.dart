import 'package:auth_mobile_app/core/usecases/usecase.dart';
import 'package:auth_mobile_app/features/authentication/domain/repositories/auth_repo.dart';

class GetUserTokenUseCase extends UseCase<Future<String?>> {
  final AuthRepo _authRepo;

  GetUserTokenUseCase({required AuthRepo authRepo}) : _authRepo = authRepo;

  @override
  Future<String?> call() {
    return _authRepo.getStoredToken();
  }

}