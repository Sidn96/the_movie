import 'package:the_movie/core/network/api/api_result.dart';
import 'package:the_movie/features/home/data/dtos/home_dto.dart';

import '../../../../core/network/api/api_service.dart';

abstract class HomeDataSource {
  Future<HomeDto?> getData(
      {required HomeDto Function(Map<String, dynamic>) mapper});
}

class HomeRemoteDataSourceImpl implements HomeDataSource {
  final ApiService api = getApiService();

  static const String endPoint = '/3/movie/popular';

  HomeRemoteDataSourceImpl();

  @override
  Future<HomeDto?> getData(
      {required HomeDto Function(Map<String, dynamic>) mapper}) async {
    try {
      const apiKey = "14a32628e0af154ee83c146a63405429";
      var response = await api.getData(
          path: "$endPoint?api_key=$apiKey&language=en-US&page=1",
          sendToken: true,
          ignoreSessionExpire: true);

      final result = ApiResult.fromResponse(response, mapper);

      if (result is Success) {
        return response.data as HomeDto;
      } else {
        return const HomeDto();
      }

      // } on ServerException catch (err) {
      //   try {
      //     return ServerError.fromResponse(err.fullErrorResponse?.response);
      //   } catch (err1) {
      //     return InternalError('Internal Error, Something went wrong');
      //   }
    } catch (e) {
      // return InternalError('Internal Error, Something went wrong');
      return null;
    }
  }
}
