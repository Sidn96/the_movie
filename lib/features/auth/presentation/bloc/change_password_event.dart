import 'package:freezed_annotation/freezed_annotation.dart';

part 'change_password_event.freezed.dart';

@freezed
class ChangePasswordEvent with _$ChangePasswordEvent {
  const factory ChangePasswordEvent.increment() = _Increment;
  const factory ChangePasswordEvent.decrement() = _Decrement;
}
