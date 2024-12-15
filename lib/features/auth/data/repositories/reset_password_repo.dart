import '../../domain/repositories/reset_password_repo_i.dart';
import '../datasources/reset_password_datasource.dart';

class ResetPasswordRepoImpl implements ResetPasswordRepo {
  final ResetPasswordDataSource dataSource;

  ResetPasswordRepoImpl({required this.dataSource});
}
