import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/usecases/reset_password_usecase.dart';

import 'reset_password_event.dart';
import 'reset_password_state.dart';

class ResetPasswordBloc extends Bloc<ResetPasswordEvent, ResetPasswordState> {
  ResetPasswordUsecase resetPasswordUsecase;

  ResetPasswordBloc({required this.resetPasswordUsecase})
      : super(const ResetPasswordState.initial()) {
    on<ResetPasswordEvent>(_mapEventToState);
  }

  void _mapEventToState(
      ResetPasswordEvent event, Emitter<ResetPasswordState> emit) {
    event.map(
      increment: (_) {},
      decrement: (_) {}
    );
  }

}
