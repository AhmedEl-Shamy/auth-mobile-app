import 'package:auth_mobile_app/core/utils/failure.dart';
import 'package:auth_mobile_app/features/authentication/domain/entities/user_entity.dart';
import 'package:auth_mobile_app/features/authentication/domain/usecases/get_user_token_usecase.dart';
import 'package:auth_mobile_app/features/authentication/domain/usecases/log_in_usecase.dart';
import 'package:auth_mobile_app/features/authentication/domain/usecases/log_in_with_token_usecase.dart';
import 'package:auth_mobile_app/features/authentication/domain/usecases/log_out_usecase.dart';
import 'package:auth_mobile_app/features/authentication/domain/usecases/store_user_token_usecase.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'log_in_out_state.dart';

class LogInOutCubit extends Cubit<LogInOutState> {
  final LogInUseCase _logInUsecase;
  final LogInWithTokenUseCase _logInWithTokenUseCase;
  final LogOutUseCase _logOutUsecase;
  final StoreUserTokenUseCase _storeUserTokenUseCase;
  final GetUserTokenUseCase _getUserTokenUsecase;

  LogInOutCubit({
    required StoreUserTokenUseCase storeUserTokenUseCase,
    required GetUserTokenUseCase getUserTokenUsecase,
    required LogInUseCase logInUsecase,
    required LogInWithTokenUseCase logInWithTokenUseCase,
    required LogOutUseCase logOutUsecase,
  })  : _logInUsecase = logInUsecase,
        _logInWithTokenUseCase = logInWithTokenUseCase,
        _logOutUsecase = logOutUsecase,
        _getUserTokenUsecase = getUserTokenUsecase,
        _storeUserTokenUseCase = storeUserTokenUseCase,
        super(
          LogInOutInitial(),
        );

  bool isRememberMeChecked = false;

  Future<void> logIn({
    required String username,
    required String password,
  }) async {
    emit(LogInOutLoading());
    Map<String, String> credentials = {
      'username': username,
      'password': password,
    };
    Either<Failure, UserEntity> data = await _logInUsecase.call(credentials);
    data.fold(
      (failure) => emit(LogInOutFailed(failure: failure)),
      (user) async {
        if (isRememberMeChecked) {
          await _storeUserTokenUseCase.call(user.userToken);
        }
        emit(LogInSucsses(user: user));
      },
    );
  }

  Future<void> logInWithToken() async {
    emit(LogInOutLoading());
    String? token = await _getUserTokenUsecase.call();

    if (token == null || token.isEmpty) {
      emit(NoTokenSavedState());
      return;
    }
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
