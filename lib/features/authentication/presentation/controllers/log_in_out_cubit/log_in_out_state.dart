part of 'log_in_out_cubit.dart';

sealed class LogInOutState {}

final class LogInOutInitial extends LogInOutState {}
final class LogInOutLoading extends LogInOutState {}
final class LogInOutSucsses extends LogInOutState {}
final class LogInOutFaild extends LogInOutState {}
final class LogInOutLogOut extends LogInOutState {}
