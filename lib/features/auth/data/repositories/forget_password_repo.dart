import '../../domain/repositories/forget_password_repo_i.dart';
import '../datasources/forget_password_datasource.dart';

class ForgetPasswordRepoImpl implements ForgetPasswordRepo {
  final ForgetPasswordDataSource dataSource;

  ForgetPasswordRepoImpl({required this.dataSource});
}
