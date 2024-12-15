import 'package:freezed_annotation/freezed_annotation.dart';

part 'reset_password_entity.freezed.dart';

@freezed
class ResetPasswordEntity with _$ResetPasswordEntity   {
  const factory ResetPasswordEntity({
    String? error,
  }) = _ResetPasswordEntity;
}