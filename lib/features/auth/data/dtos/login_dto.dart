import 'package:freezed_annotation/freezed_annotation.dart';

part 'login_dto.g.dart';
part 'login_dto.freezed.dart';

@freezed
class LoginDto with _$LoginDto {
  const factory LoginDto({
    required int status,
    required bool success,
    String? message,
    Data? data,
    String? error,
  }) = _LoginDto;

  factory LoginDto.fromJson(Map<String, dynamic> json) =>
      _$LoginDtoFromJson(json);
}

@freezed
class Data with _$Data {
  const factory Data({
    String? id,  
  }) = _Data;

  factory Data.fromJson(Map<String, dynamic> json) =>
      _$DataFromJson(json);
}