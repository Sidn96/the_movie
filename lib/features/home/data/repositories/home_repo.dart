import 'package:the_movie/features/home/data/dtos/home_dto.dart';
import 'package:the_movie/features/home/domain/entities/home_entity.dart';

import '../../domain/repositories/home_repo_i.dart';
import '../datasources/home_datasource.dart';

class HomeRepoImpl implements HomeRepo {
  HomeRepoImpl();

  @override
  Future<HomeEntity?> getData() async {
    final HomeRemoteDataSourceImpl dataSource = HomeRemoteDataSourceImpl();

    var response = await dataSource.getData(mapper: HomeDto.fromJson);

    final d = response?.data;
    final entity = HomeEntity(
      id: d?.id ?? 0,
      title: d?.title ?? "",
      overview: d?.title ?? "",
      posterPath: d?.title ?? "",
    );
    return entity;
  }
}
