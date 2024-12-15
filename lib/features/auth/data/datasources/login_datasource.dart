import '../../../../core/network/api/api_service.dart';

abstract class LoginDataSource {}

class LoginRemoteDataSourceImpl implements LoginDataSource {
  final ApiService api;

  static const String endPoint = '/';

  LoginRemoteDataSourceImpl({required this.api});
}
