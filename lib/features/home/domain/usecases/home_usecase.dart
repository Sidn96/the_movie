import 'package:the_movie/features/home/data/repositories/home_repo.dart';
import 'package:the_movie/features/home/domain/entities/home_entity.dart';

abstract class HomeUsecase {
  Future<HomeEntity?> getData();
}

class HomeUsecaseImpl implements HomeUsecase {
  HomeUsecaseImpl();

  @override
  Future<HomeEntity?> getData() async {
    HomeRepoImpl homeRepo = HomeRepoImpl();
    final data = await homeRepo.getData();
    
    return data;
  }
}
