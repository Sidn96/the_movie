import '../repositories/reset_password_repo_i.dart';

abstract class ResetPasswordUsecase {}

class ResetPasswordUsecaseImpl implements ResetPasswordUsecase {
  final ResetPasswordRepo resetPasswordRepo;

  ResetPasswordUsecaseImpl({required this.resetPasswordRepo});
}
