import 'package:core/core.dart';

import '../repositories/repositories.dart';

abstract interface class ICreateAccountUseCase {
  Future<Either<Failure, void>> call(Account account);
}

final class CreateAccountUseCase implements ICreateAccountUseCase {
  final IAccountRepository _repository;
  CreateAccountUseCase(this._repository);

  @override
  Future<Either<Failure, void>> call(Account account) async {
    return await _repository.createAccount(account);
  }
}
