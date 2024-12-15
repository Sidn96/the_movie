import 'package:freezed_annotation/freezed_annotation.dart';

part 'change_password_state.freezed.dart';

@freezed
class ChangePasswordState with _$ChangePasswordState {  
  const factory ChangePasswordState.initial() = _Initial;
  const factory ChangePasswordState.loading(int count) = _Loding;
  const factory ChangePasswordState.loaded(int count) = _Loaded;
  const factory ChangePasswordState.error(int count) = _Error;
}
