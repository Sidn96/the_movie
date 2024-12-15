import 'package:freezed_annotation/freezed_annotation.dart';

part 'reset_password_dto.g.dart';
part 'reset_password_dto.freezed.dart';

@freezed
class ResetPasswordDto with _$ResetPasswordDto {
  const factory ResetPasswordDto({
    required int status,
    required bool success,
    String? message,
    Data? data,
    String? error,
  }) = _ResetPasswordDto;

  factory ResetPasswordDto.fromJson(Map<String, dynamic> json) =>
      _$ResetPasswordDtoFromJson(json);
}

@freezed
class Data with _$Data {
  const factory Data({
    String? id,  
  }) = _Data;

  factory Data.fromJson(Map<String, dynamic> json) =>
      _$DataFromJson(json);
}