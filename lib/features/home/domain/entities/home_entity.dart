import 'package:freezed_annotation/freezed_annotation.dart';

part 'home_entity.freezed.dart';

@freezed
class HomeEntity with _$HomeEntity {
  const factory HomeEntity({
    required int id,
    required String title,
    required String overview,
    required String posterPath,
  }) = _HomeEntity;
}
