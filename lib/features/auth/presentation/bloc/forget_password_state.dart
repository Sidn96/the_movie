import 'package:freezed_annotation/freezed_annotation.dart';

part 'forget_password_state.freezed.dart';

@freezed
class ForgetPasswordState with _$ForgetPasswordState {  
  const factory ForgetPasswordState.initial() = _Initial;
  const factory ForgetPasswordState.loading(int count) = _Loding;
  const factory ForgetPasswordState.loaded(int count) = _Loaded;
  const factory ForgetPasswordState.error(int count) = _Error;
}
