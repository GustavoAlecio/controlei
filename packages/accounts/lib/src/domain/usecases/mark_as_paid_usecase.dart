import 'package:core/core.dart';

import '../repositories/account_repository.dart';

abstract interface class IMarkAsPaidUseCase {
  Future<Either<Failure, void>> call(String id);
}

final class MarkAsPaidUseCase implements IMarkAsPaidUseCase {
  final IAccountRepository _repository;

  MarkAsPaidUseCase(this._repository);

  @override
  Future<Either<Failure, void>> call(String id) async {
    return await _repository.markAsPaid(id);
  }
}
