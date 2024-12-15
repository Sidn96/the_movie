import '../repositories/login_repo_i.dart';

abstract class LoginUsecase {}

class LoginUsecaseImpl implements LoginUsecase {
  final LoginRepo loginRepo;

  LoginUsecaseImpl({required this.loginRepo});
}
