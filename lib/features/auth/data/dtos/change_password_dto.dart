import 'package:freezed_annotation/freezed_annotation.dart';

part 'change_password_dto.g.dart';
part 'change_password_dto.freezed.dart';

@freezed
class ChangePasswordDto with _$ChangePasswordDto {
  const factory ChangePasswordDto({
    required int status,
    required bool success,
    String? message,
    Data? data,
    String? error,
  }) = _ChangePasswordDto;

  factory ChangePasswordDto.fromJson(Map<String, dynamic> json) =>
      _$ChangePasswordDtoFromJson(json);
}

@freezed
class Data with _$Data {
  const factory Data({
    String? id,  
  }) = _Data;

  factory Data.fromJson(Map<String, dynamic> json) =>
      _$DataFromJson(json);
}