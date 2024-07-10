import 'package:flutter_bloc/flutter_bloc.dart';

part 'log_in_out_state.dart';

class LogInOutCubit extends Cubit<LogInOutState> {
  LogInOutCubit() : super(LogInOutInitial());
}
