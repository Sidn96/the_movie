import 'package:freezed_annotation/freezed_annotation.dart';

part 'change_password_entity.freezed.dart';

@freezed
class ChangePasswordEntity with _$ChangePasswordEntity   {
  const factory ChangePasswordEntity({
    String? error,
  }) = _ChangePasswordEntity;
}