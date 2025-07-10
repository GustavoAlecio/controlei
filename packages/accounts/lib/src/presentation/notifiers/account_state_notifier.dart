import 'package:core/core.dart';
import 'package:dependencies/dependencies.dart';

import '../../../accounts.dart';

final accountsProvider =
    StateNotifierProvider<AccountsNotifier, AsyncValue<AccountState>>(
  (ref) => AccountsNotifier(
    ref.watch(getAccountsUseCaseProvider),
    ref.watch(getCategoriesUseCaseProvider),
    ref.watch(markAsPaiUseCaseProvider),
  ),
);

class AccountsNotifier extends StateNotifier<AsyncValue<AccountState>> {
  final IGetAccountsUseCase _getAccountsUseCase;
  final IGetCategoriesUseCase _getCategoriesUseCase;
  final IMarkAsPaidUseCase _markAsPaidUseCase;

  AccountsNotifier(
    this._getAccountsUseCase,
    this._getCategoriesUseCase,
    this._markAsPaidUseCase,
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

  Future<void> markAsPaid(String id) async {
    final result = await _markAsPaidUseCase.call(id);

    state = result.fold(
          (failure) => state,
          (updatedAccount) {
        final currentState = state.value!;
        final updatedAccounts = currentState.accounts.map((acc) {
          return acc.id == id ? updatedAccount : acc;
        }).toList();

        return AsyncData(currentState.copyWith(accounts: updatedAccounts));
      },
    );
  }

  List<Account> accountsByCategory(String category) => state is AsyncData
      ? (state as AsyncData)
          .value
          .accounts
          .where((a) => a.category == category)
          .toList()
      : [];
}
