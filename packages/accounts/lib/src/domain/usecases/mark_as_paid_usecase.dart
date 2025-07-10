import 'package:core/core.dart';

import '../entities/entities.dart';
import '../repositories/account_repository.dart';

abstract interface class IMarkAsPaidUseCase {
  Future<Either<Failure, Account>> call(String id);
}

final class MarkAsPaidUseCase implements IMarkAsPaidUseCase {
  final IAccountRepository _repository;

  MarkAsPaidUseCase(this._repository);

  @override
  Future<Either<Failure, Account>> call(String id) async {
    return await _repository.markAsPaid(id);
  }
}
