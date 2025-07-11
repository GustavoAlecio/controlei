import 'package:core/core.dart';

abstract class IAccountDatasource {
  Future<void> save(AccountModel account);
  Future<List<AccountModel>> getAll();
}

final class AccountDatasource implements IAccountDatasource{
  final ILocalStorage<AccountModel> _storage;
  AccountDatasource(this._storage);

  @override
  Future<void> save(AccountModel account) async {
    await _storage.save(account);
  }

  @override
  Future<List<AccountModel>> getAll() async {
    return await _storage.getAll();
  }

}