import '../../../../core/network/api/api_service.dart';

abstract class ForgetPasswordDataSource {}

class ForgetPasswordRemoteDataSourceImpl implements ForgetPasswordDataSource {
  final ApiService api;

  static const String endPoint = '/';

  ForgetPasswordRemoteDataSourceImpl({required this.api});
}
