import 'package:auth_mobile_app/core/utils/failure.dart';
import 'package:auth_mobile_app/features/authentication/domain/usecases/register_usecase.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  final RegisterUseCase _registerUseCase;
  final TextEditingController userNameController;
  final TextEditingController emailController;
  final TextEditingController passwordController;

  RegisterCubit({
    required RegisterUseCase registerUseCase,
    required this.userNameController,
    required this.emailController,
    required this.passwordController,
  })  : _registerUseCase = registerUseCase,
        super(
          RegisterInitial(),
        );

  Future<void> registerUser() async {
    emit(RegisterLoading());
    Map<String, String> userData = {};
    Either<Failure, bool> result = await _registerUseCase.call(userData);
    result.fold(
      (failure) => emit(RegisterFailed(failure: failure)),
      (result) => emit(RegisterSuccess()),
    );
  }
}
