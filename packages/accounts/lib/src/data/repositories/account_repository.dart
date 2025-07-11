import 'package:core/core.dart';
import '../../domain/domain.dart';
import '../datasources/account_datasource.dart';

class AccountRepository implements IAccountRepository {
  final IAccountDatasource _datasource;

  AccountRepository(this._datasource);

  @override
  Future<Either<Failure, void>> createAccount(Account account) async {
    try {
      final model = AccountModel.fromEntity(account);
      await _datasource.save(model);
      return const Right(null);
    } catch (e) {
      return Left(Failure.unknown(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> deleteAccount(String id) {
    // TODO: implement deleteAccount
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, List<Account>>> getAccountsByFilter(
      AccountFilter filter) {
    // TODO: implement getAccountsByFilter
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, List<Account>>> getAll() async {
    try {
      final response = await _datasource.getAll();
      final list = response.map((e) => e.toEntity()).toList();
      return Right(list);
    } catch (e) {
      return Left(Failure.unknown(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<String>>> getCategories() async {
    try {
      final result = await _datasource.getAll();
      final categories = result.map((e) => e.category).toSet().toList();
      return Right(categories);
    } catch (e, s) {
      final failure = Failure.fromException(e, s);
      LoggerService().error(failure.message, error: e, stackTrace: s);
      return Left(failure);
    }
  }

  @override
  Future<Either<Failure, Account>> markAsPaid(String id) async {
    try {
      final result = await _datasource.getAll();

      final index = result.indexWhere((a) => a.id == id);
      if (index != -1) {
        result[index] = result[index].copyWith(status: PaymentStatusModel.paid);
      }
      _datasource.save(result[index]);
      return Right(result[index].toEntity());
    } catch (e, s) {
      final failure = Failure.fromException(e, s);
      LoggerService().error(failure.message, error: e, stackTrace: s);
      return Left(failure);
    }
  }

  @override
  Future<Either<Failure, void>> updateAccount(Account account) {
    // TODO: implement updateAccount
    throw UnimplementedError();
  }
}
