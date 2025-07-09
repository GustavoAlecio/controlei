import 'package:core/core.dart';

import '../repositories/repositories.dart';

abstract interface class IDeleteAccountUseCase {
  Future<Either<Failure, void>> call(String id);
}

final class DeleteAccountUseCase implements IDeleteAccountUseCase {
  final IAccountRepository _repository;

  DeleteAccountUseCase(this._repository);

  @override
  Future<Either<Failure, void>> call(String id) async {
    return await _repository.deleteAccount(id);
  }
}
