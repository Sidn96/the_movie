import 'package:freezed_annotation/freezed_annotation.dart';

part 'forget_password_event.freezed.dart';

@freezed
class ForgetPasswordEvent with _$ForgetPasswordEvent {
  const factory ForgetPasswordEvent.increment() = _Increment;
  const factory ForgetPasswordEvent.decrement() = _Decrement;
}
