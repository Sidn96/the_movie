import '../repositories/forget_password_repo_i.dart';

abstract class ForgetPasswordUsecase {}

class ForgetPasswordUsecaseImpl implements ForgetPasswordUsecase {
  final ForgetPasswordRepo forgetPasswordRepo;

  ForgetPasswordUsecaseImpl({required this.forgetPasswordRepo});
}
