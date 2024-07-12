part of 'log_in_out_cubit.dart';

sealed class LogInOutState {}

final class LogInOutInitial extends LogInOutState {}
final class LogInOutLoading extends LogInOutState {}
final class LogInSucsses extends LogInOutState {
  final UserEntity user;

  LogInSucsses({required this.user});

}
final class LogInOutFailed extends LogInOutState {
  final Failure failure;

  LogInOutFailed({required this.failure});

}
final class LogOutSuccess extends LogInOutState {}
final class NoTokenSavedState extends LogInOutState {}
