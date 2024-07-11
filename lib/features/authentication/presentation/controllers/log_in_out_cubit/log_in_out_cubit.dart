import 'package:auth_mobile_app/core/utils/failure.dart';
import 'package:auth_mobile_app/features/authentication/domain/entities/user_entity.dart';
import 'package:auth_mobile_app/features/authentication/domain/usecases/log_in_usecase.dart';
import 'package:auth_mobile_app/features/authentication/domain/usecases/log_in_with_token_usecase.dart';
import 'package:auth_mobile_app/features/authentication/domain/usecases/log_out_usecase.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'log_in_out_state.dart';

class LogInOutCubit extends Cubit<LogInOutState> {
  final LogInUsecase _logInUsecase;
  final LogInWithTokenUseCase _logInWithTokenUseCase;
  final LogOutUsecase _logOutUsecase;

  final TextEditingController userNameController;
  final TextEditingController passwordController;

  LogInOutCubit({
    required LogInUsecase logInUsecase,
    required LogInWithTokenUseCase logInWithTokenUseCase,
    required LogOutUsecase logOutUsecase,
    required this.userNameController,
    required this.passwordController,
  })  : _logInUsecase = logInUsecase,
        _logInWithTokenUseCase = logInWithTokenUseCase,
        _logOutUsecase = logOutUsecase,
        super(
          LogInOutInitial(),
        );

  Future<void> logIn() async {
    emit(LogInOutLoading());
    Map<String, String> credentials = {
      'username': userNameController.text,
      'password': passwordController.text,
    };
    Either<Failure, UserEntity> data = await _logInUsecase.call(credentials);
    data.fold(
      (failure) => emit(LogInOutFailed(failure: failure)),
      (user) => emit(LogInSucsses(user: user)),
    );
  }

  Future<void> logInWithToken(String token) async {
    emit(LogInOutLoading());
    Map<String, String> headers = {
      'Authorization': 'Bearer $token',
    };
    Either<Failure, UserEntity> data =
        await _logInWithTokenUseCase.call(headers);
    data.fold(
      (failure) => emit(LogInOutFailed(failure: failure)),
      (user) => emit(LogInSucsses(user: user)),
    );
  }

  Future<void> logOut() async {
    emit(LogInOutLoading());
    await _logOutUsecase.call();
    emit(LogOutSuccess());
  }
}
