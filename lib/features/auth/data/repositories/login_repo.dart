import '../../domain/repositories/login_repo_i.dart';
import '../datasources/login_datasource.dart';

class LoginRepoImpl implements LoginRepo {
  final LoginDataSource dataSource;

  LoginRepoImpl({required this.dataSource});
}
