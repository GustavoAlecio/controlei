import 'package:core/core.dart';

import '../repositories/repositories.dart';

abstract interface class IUpdateAccountUseCase {
  Future<Either<Failure, void>> call(Account account);
}

final class UpdateAccountUseCase implements IUpdateAccountUseCase {
  final IAccountRepository _repository;

  UpdateAccountUseCase(this._repository);

  @override
  Future<Either<Failure, void>> call(Account account) async {
    return await _repository.updateAccount(account);
  }
}
