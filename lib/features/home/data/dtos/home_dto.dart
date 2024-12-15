import 'package:freezed_annotation/freezed_annotation.dart';

part 'home_dto.g.dart';
part 'home_dto.freezed.dart';

@freezed
class HomeDto with _$HomeDto {
  const factory HomeDto({
    int? status,
    bool? success,
    String? message,
    Data? data,
    String? error,
  }) = _HomeDto;

  factory HomeDto.fromJson(Map<String, dynamic> json) =>
      _$HomeDtoFromJson(json);
}

@freezed
class Data with _$Data {
  const factory Data({
    int? id,
    String? title,
    String? overview,
    String? posterPath,
  }) = _Data;

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);
}
