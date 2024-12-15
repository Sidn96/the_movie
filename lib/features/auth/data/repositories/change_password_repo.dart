import '../../domain/repositories/change_password_repo_i.dart';
import '../datasources/change_password_datasource.dart';

class ChangePasswordRepoImpl implements ChangePasswordRepo {
  final ChangePasswordDataSource dataSource;

  ChangePasswordRepoImpl({required this.dataSource});
}
