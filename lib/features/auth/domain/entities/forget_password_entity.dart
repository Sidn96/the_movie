import 'package:freezed_annotation/freezed_annotation.dart';

part 'forget_password_entity.freezed.dart';

@freezed
class ForgetPasswordEntity with _$ForgetPasswordEntity   {
  const factory ForgetPasswordEntity({
    String? error,
  }) = _ForgetPasswordEntity;
}