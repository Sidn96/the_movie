import '../repositories/change_password_repo_i.dart';

abstract class ChangePasswordUsecase {}

class ChangePasswordUsecaseImpl implements ChangePasswordUsecase {
  final ChangePasswordRepo changePasswordRepo;

  ChangePasswordUsecaseImpl({required this.changePasswordRepo});
}
