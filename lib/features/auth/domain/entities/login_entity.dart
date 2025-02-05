import 'package:freezed_annotation/freezed_annotation.dart';

part 'login_entity.freezed.dart';

@freezed
class LoginEntity with _$LoginEntity   {
  const factory LoginEntity({
    String? error,
  }) = _LoginEntity;
}