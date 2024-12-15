import 'package:freezed_annotation/freezed_annotation.dart';

part 'login_state.freezed.dart';

@freezed
class LoginState with _$LoginState {  
  const factory LoginState.initial() = _Initial;
  const factory LoginState.loading(int count) = _Loding;
  const factory LoginState.loaded(int count) = _Loaded;
  const factory LoginState.error(int count) = _Error;
}
