import 'package:freezed_annotation/freezed_annotation.dart';

part 'reset_password_event.freezed.dart';

@freezed
class ResetPasswordEvent with _$ResetPasswordEvent {
  const factory ResetPasswordEvent.increment() = _Increment;
  const factory ResetPasswordEvent.decrement() = _Decrement;
}
