import 'package:core/core.dart';

import '../entities/entities.dart';

abstract interface class IAccountRepository {
  Future<Either<Failure, List<Account>>> getAll();
  Future<Either<Failure, List<String>>> getCategories();
  Future<Either<Failure, List<Account>>> getAccountsByFilter(
    AccountFilter filter,
  );
  Future<Either<Failure, void>> createAccount(Account account);
  Future<Either<Failure, void>> updateAccount(Account account);
  Future<Either<Failure, void>> deleteAccount(String id);
  Future<Either<Failure, Account>> markAsPaid(String id);

}
