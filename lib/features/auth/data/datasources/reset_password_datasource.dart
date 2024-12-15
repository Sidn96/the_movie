import '../../../../core/network/api/api_service.dart';

abstract class ResetPasswordDataSource {}

class ResetPasswordRemoteDataSourceImpl implements ResetPasswordDataSource {
  final ApiService api;

  static const String endPoint = '/';

  ResetPasswordRemoteDataSourceImpl({required this.api});
}
