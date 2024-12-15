import 'package:freezed_annotation/freezed_annotation.dart';

part 'reset_password_state.freezed.dart';

@freezed
class ResetPasswordState with _$ResetPasswordState {  
  const factory ResetPasswordState.initial() = _Initial;
  const factory ResetPasswordState.loading(int count) = _Loding;
  const factory ResetPasswordState.loaded(int count) = _Loaded;
  const factory ResetPasswordState.error(int count) = _Error;
}
