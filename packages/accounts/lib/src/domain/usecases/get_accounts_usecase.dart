import 'package:core/core.dart';

import '../repositories/repositories.dart';

abstract interface class IGetAccountsUseCase {
  Future<Either<Failure, List<Account>>> call();
}

final class GetAccountsUseCase implements IGetAccountsUseCase {
  final IAccountRepository _repository;

  GetAccountsUseCase(this._repository);

  @override
  Future<Either<Failure, List<Account>>> call() async {
    final result = await _repository.getAll();
    return result.fold((failure) => Left(failure), (accounts) {
      accounts.sort((a, b) => a.dueDate.compareTo(b.dueDate));
      return Right(accounts);
    });
  }
}
