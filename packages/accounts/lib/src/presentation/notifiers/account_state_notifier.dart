import 'package:core/core.dart';
import 'package:dependencies/dependencies.dart';

import '../../../accounts.dart';

final accountsProvider =
    StateNotifierProvider<AccountsNotifier, AsyncValue<AccountState>>(
  (ref) => AccountsNotifier(
    ref.watch(getAccountsUseCaseProvider),
    ref.watch(getCategoriesUseCaseProvider),
  ),
);

class AccountsNotifier extends StateNotifier<AsyncValue<AccountState>> {
  final IGetAccountsUseCase _getAccountsUseCase;
  final IGetCategoriesUseCase _getCategoriesUseCase;

  AccountsNotifier(
    this._getAccountsUseCase,
    this._getCategoriesUseCase,
  ) : super(const AsyncLoading()) {
    load();
  }

  Future<void> load() async {
    state = const AsyncLoading();
    final [
      accounts as Either<Failure, List<Account>>,
      categories as Either<Failure, List<String>>
    ] = await Future.wait([
      _getAccountsUseCase(),
      _getCategoriesUseCase(),
    ]);
    if (accounts.isLeft || categories.isLeft) {
      state = AsyncError(
          accounts.toLeft() ?? categories.toLeft()!, StackTrace.current);
      return;
    }
    state = AsyncData(
      AccountState(
        accounts: accounts.toRight()!,
        categories: categories.toRight()!,
      ),
    );
  }

  List<String> get allCategories =>
      state is AsyncData ? (state as AsyncData).value.categories : [];

  List<Account> accountsByCategory(String category) => state is AsyncData
      ? (state as AsyncData)
          .value
          .accounts
          .where((a) => a.category == category)
          .toList()
      : [];
}
