import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/usecases/login_usecase.dart';

import 'login_event.dart';
import 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginUsecase loginUsecase;

  LoginBloc({required this.loginUsecase})
      : super(const LoginState.initial()) {
    on<LoginEvent>(_mapEventToState);
  }

  void _mapEventToState(
      LoginEvent event, Emitter<LoginState> emit) {
    event.map(
      increment: (_) {},
      decrement: (_) {}
    );
  }

}
