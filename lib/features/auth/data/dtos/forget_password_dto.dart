import 'package:freezed_annotation/freezed_annotation.dart';

part 'forget_password_dto.g.dart';
part 'forget_password_dto.freezed.dart';

@freezed
class ForgetPasswordDto with _$ForgetPasswordDto {
  const factory ForgetPasswordDto({
    required int status,
    required bool success,
    String? message,
    Data? data,
    String? error,
  }) = _ForgetPasswordDto;

  factory ForgetPasswordDto.fromJson(Map<String, dynamic> json) =>
      _$ForgetPasswordDtoFromJson(json);
}

@freezed
class Data with _$Data {
  const factory Data({
    String? id,  
  }) = _Data;

  factory Data.fromJson(Map<String, dynamic> json) =>
      _$DataFromJson(json);
}