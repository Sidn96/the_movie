import 'package:the_movie/features/home/domain/entities/home_entity.dart';

abstract class HomeRepo {
  Future<HomeEntity?> getData();
}
