import '../../../../core/network/api/api_service.dart';

abstract class ChangePasswordDataSource {}

class ChangePasswordRemoteDataSourceImpl implements ChangePasswordDataSource {
  final ApiService api;

  static const String endPoint = '/';

  ChangePasswordRemoteDataSourceImpl({required this.api});
}
