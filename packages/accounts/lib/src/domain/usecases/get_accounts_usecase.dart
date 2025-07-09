import 'package:core/core.dart';

import '../entities/entities.dart';
import '../repositories/repositories.dart';

abstract interface class IGetAccountsUseCase {
  Future<Either<Failure, List<Account>>> call();
}

final class GetAccountsUseCase implements IGetAccountsUseCase {
  final IAccountRepository _repository;

  GetAccountsUseCase(this._repository);

  @override
  Future<Either<Failure, List<Account>>> call() async {
    return await _repository.getAll();
  }
}
