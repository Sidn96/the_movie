import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/usecases/home_usecase.dart';

import 'home_event.dart';
import 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeUsecaseImpl homeUsecase = HomeUsecaseImpl();

  HomeBloc() : super(const HomeState.initial()) {
    on<HomeEvent>(_mapEventToState);
  }

  void _mapEventToState(HomeEvent event, Emitter<HomeState> emit) async{
    event.map(
      getData: (_) async {
        try {
          emit(const HomeState.loading());

          final data = await homeUsecase.getData();

          if (data != null) {
            emit(HomeState.success(data));
          } else {
            emit(const HomeState.error());
          }
        } catch (e) {
          print("error $e");
        }
      },
    );
  }
}
