import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/usecases/forget_password_usecase.dart';

import 'forget_password_event.dart';
import 'forget_password_state.dart';

class ForgetPasswordBloc extends Bloc<ForgetPasswordEvent, ForgetPasswordState> {
  ForgetPasswordUsecase forgetPasswordUsecase;

  ForgetPasswordBloc({required this.forgetPasswordUsecase})
      : super(const ForgetPasswordState.initial()) {
    on<ForgetPasswordEvent>(_mapEventToState);
  }

  void _mapEventToState(
      ForgetPasswordEvent event, Emitter<ForgetPasswordState> emit) {
    event.map(
      increment: (_) {},
      decrement: (_) {}
    );
  }

}
