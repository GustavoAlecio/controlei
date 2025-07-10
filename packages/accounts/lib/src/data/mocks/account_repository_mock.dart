import 'package:accounts/accounts.dart';
import 'package:core/core.dart';
import 'package:dependencies/dependencies.dart';

final class AccountRepositoryMock implements IAccountRepository {
  final _storage = <Account>[];

  @override
  Future<Either<Failure, void>> createAccount(Account account) async {
    try {
      final newAccount = account.copyWith(id: const Uuid().v4());
      _storage.add(newAccount);
      return const Right(null);
    } catch (e, s) {
      final failure = Failure.fromException(e, s);
      LoggerService().error(failure.message, error: e, stackTrace: s);
      return Left(failure);
    }
  }

  @override
  Future<Either<Failure, void>> deleteAccount(String id) async {
    try {
      _storage.removeWhere((a) => a.id == id);
      return const Right(null);
    } catch (e, s) {
      final failure = Failure.fromException(e, s);
      LoggerService().error(failure.message, error: e, stackTrace: s);
      return Left(failure);
    }
  }

  @override
  Future<Either<Failure, List<Account>>> getAccountsByFilter(
    AccountFilter filter,
  ) async {
    try {
      final list = _storage.where((account) {
        final matchType = !filter.selectedType || filter.type == account.type;
        final matchStatus =
            !filter.selectedStatus || filter.status == account.status;
        final matchMonth = !filter.selectedMonth ||
            (account.dueDate.year == filter.month?.year &&
                account.dueDate.month == filter.month?.month);
        final matchCategory =
            !filter.selectedCategory || account.category == filter.category;

        return matchType && matchStatus && matchMonth && matchCategory;
      }).toList();
      return Right(list);
    } catch (e, s) {
      final failure = Failure.fromException(e, s);
      LoggerService().error(failure.message, error: e, stackTrace: s);
      return Left(failure);
    }
  }

  @override
  Future<Either<Failure, List<Account>>> getAll() async {
    try {
      return Right(_storage);
    } catch (e, s) {
      final failure = Failure.fromException(e, s);
      LoggerService().error(failure.message, error: e, stackTrace: s);
      return Left(failure);
    }
  }

  @override
  Future<Either<Failure, Account>> markAsPaid(String id) async {
    try {
      final index = _storage.indexWhere((a) => a.id == id);
      if (index != -1) {
        _storage[index] = _storage[index].copyWith(status: PaymentStatus.paid);
      }
      return Right(_storage[index]);
    } catch (e, s) {
      final failure = Failure.fromException(e, s);
      LoggerService().error(failure.message, error: e, stackTrace: s);
      return Left(failure);
    }
  }

  @override
  Future<Either<Failure, void>> updateAccount(Account account) async {
    try {
      final index = _storage.indexWhere((a) => a.id == account.id);
      if (index != -1) {
        _storage[index] = account;
      }
      return const Right(null);
    } catch (e, s) {
      final failure = Failure.fromException(e, s);
      LoggerService().error(failure.message, error: e, stackTrace: s);
      return Left(failure);
    }
  }

  @override
  Future<Either<Failure, List<String>>> getCategories() async {
    try {
      final categories = _storage.map((e) => e.category).toSet().toList();
      return Right(categories);
    } catch (e, s) {
      final failure = Failure.fromException(e, s);
      LoggerService().error(failure.message, error: e, stackTrace: s);
      return Left(failure);
    }
  }
}
