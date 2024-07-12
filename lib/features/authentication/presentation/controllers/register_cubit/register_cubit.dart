import 'package:auth_mobile_app/core/utils/failure.dart';
import 'package:auth_mobile_app/features/authentication/domain/usecases/register_usecase.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  final RegisterUseCase _registerUseCase;

  RegisterCubit({
    required RegisterUseCase registerUseCase,
  })  : _registerUseCase = registerUseCase,
        super(RegisterInitial());

  Future<void> registerUser({
    required String username,
    required String email,
    required String password,
  }) async {
    emit(RegisterLoading());
    Map<String, String> userData = {
      'username': username,
      'email': email,
      'password': password,
    };
    Either<Failure, bool> result = await _registerUseCase.call(userData);
    result.fold(
      (failure) => emit(RegisterFailed(failure: failure)),
      (result) => emit(RegisterSuccess()),
    );
  }
}
