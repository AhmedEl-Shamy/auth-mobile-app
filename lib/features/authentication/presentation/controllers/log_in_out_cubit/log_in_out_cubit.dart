import 'package:auth_mobile_app/core/utils/failure.dart';
import 'package:auth_mobile_app/features/authentication/domain/entities/user_entity.dart';
import 'package:auth_mobile_app/features/authentication/domain/usecases/log_in_usecase.dart';
import 'package:auth_mobile_app/features/authentication/domain/usecases/log_in_with_token_usecase.dart';
import 'package:auth_mobile_app/features/authentication/domain/usecases/log_out_usecase.dart';
import 'package:auth_mobile_app/features/authentication/domain/usecases/remember_user_usecase.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'log_in_out_state.dart';

class LogInOutCubit extends Cubit<LogInOutState> {
  final LogInUseCase _logInUsecase;
  final LogInWithTokenUseCase _logInWithTokenUseCase;
  final LogOutUseCase _logOutUsecase;
  final RememberUserUseCase _rememberUserUsecase;

  final TextEditingController userNameController =TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  bool isRememberMeChecked = false;

  LogInOutCubit({
    required RememberUserUseCase rememberUserUsecase,
    required LogInUseCase logInUsecase,
    required LogInWithTokenUseCase logInWithTokenUseCase,
    required LogOutUseCase logOutUsecase,
  })  : _logInUsecase = logInUsecase,
        _logInWithTokenUseCase = logInWithTokenUseCase,
        _logOutUsecase = logOutUsecase,
        _rememberUserUsecase = rememberUserUsecase,
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
      (user) {
        if (isRememberMeChecked) {
          _rememberUserUsecase.call(user);
        }
        emit(LogInSucsses(user: user));
      },
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
