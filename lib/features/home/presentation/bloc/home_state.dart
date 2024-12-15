import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:the_movie/features/home/domain/entities/home_entity.dart';

part 'home_state.freezed.dart';

@freezed
class HomeState with _$HomeState {  
  const factory HomeState.initial() = _Initial;
  const factory HomeState.loading() = _Loding;
  const factory HomeState.success(HomeEntity data) = _Success;
  const factory HomeState.error() = _Error;
}
