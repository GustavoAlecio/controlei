import 'package:accounts/src/data/data.dart';
import 'package:accounts/src/domain/domain.dart';
import 'package:dependencies/dependencies.dart';

final accountRepositoryProvider =
    Provider<IAccountRepository>((ref) => AccountRepositoryMock());

final createAccountUseCaseProvider = Provider<ICreateAccountUseCase>((ref) {
  final repo = ref.watch(accountRepositoryProvider);
  return CreateAccountUseCase(repo);
});

final deleteAccountUseCaseProvider = Provider<IDeleteAccountUseCase>((ref) {
  final repo = ref.watch(accountRepositoryProvider);
  return DeleteAccountUseCase(repo);
});

final getAccountsByFilterUseCaseProvider = Provider<IGetAccountsByFilterUseCase>((ref) {
  final repo = ref.watch(accountRepositoryProvider);
  return GetAccountsByFilterUseCase(repo);
});

final getAccountsUseCaseProvider = Provider<IGetAccountsUseCase>((ref) {
  final repo = ref.watch(accountRepositoryProvider);
  return GetAccountsUseCase(repo);
});

final markAsPaiUseCaseProvider = Provider<IMarkAsPaidUseCase>((ref) {
  final repo = ref.watch(accountRepositoryProvider);
  return MarkAsPaidUseCase(repo);
});

final updateAccountUseCaseProvider = Provider<IUpdateAccountUseCase>((ref) {
  final repo = ref.watch(accountRepositoryProvider);
  return UpdateAccountUseCase(repo);
});
final getCategoriesUseCaseProvider = Provider<IGetCategoriesUseCase>((ref) {
  final repo = ref.watch(accountRepositoryProvider);
  return GetCategoriesUseCase(repo);
});


