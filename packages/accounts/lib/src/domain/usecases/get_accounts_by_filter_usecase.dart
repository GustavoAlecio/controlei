import 'package:core/core.dart';

import '../repositories/repositories.dart';

abstract interface class IGetAccountsByFilterUseCase {
  Future<Either<Failure, List<Account>>> call(AccountFilter filter);
}

final class GetAccountsByFilterUseCase implements IGetAccountsByFilterUseCase {
  final IAccountRepository _repository;
  GetAccountsByFilterUseCase(this._repository);

  @override
  Future<Either<Failure, List<Account>>> call(AccountFilter filter) async {
    return await _repository.getAccountsByFilter(filter);
  }
}
