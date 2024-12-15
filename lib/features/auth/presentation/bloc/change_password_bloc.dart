import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/usecases/change_password_usecase.dart';

import 'change_password_event.dart';
import 'change_password_state.dart';

class ChangePasswordBloc extends Bloc<ChangePasswordEvent, ChangePasswordState> {
  ChangePasswordUsecase changePasswordUsecase;

  ChangePasswordBloc({required this.changePasswordUsecase})
      : super(const ChangePasswordState.initial()) {
    on<ChangePasswordEvent>(_mapEventToState);
  }

  void _mapEventToState(
      ChangePasswordEvent event, Emitter<ChangePasswordState> emit) {
    event.map(
      increment: (_) {},
      decrement: (_) {}
    );
  }

}
