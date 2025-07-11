import 'package:accounts/src/data/data.dart';
import 'package:accounts/src/domain/domain.dart';
import 'package:core/core.dart';
import 'package:dependencies/dependencies.dart';

final accountDatasourceProvider = Provider<IAccountDatasource>((ref) {
  final storage = ref.watch(accountLocalStorageProvider);
  return AccountDatasource(storage);
});

final accountRepositoryProvider = Provider<IAccountRepository>((ref) {
  final datasource = ref.watch(accountDatasourceProvider);
  return AccountRepository(datasource);
});
final createAccountUseCaseProvider = Provider<ICreateAccountUseCase>((ref) {
  final repository = ref.watch(accountRepositoryProvider);
  return CreateAccountUseCase(repository);
});

final deleteAccountUseCaseProvider = Provider<IDeleteAccountUseCase>((ref) {
  final repository = ref.watch(accountRepositoryProvider);
  return DeleteAccountUseCase(repository);
});

final updateAccountUseCaseProvider = Provider<IUpdateAccountUseCase>((ref) {
  final repository = ref.watch(accountRepositoryProvider);
  return UpdateAccountUseCase(repository);
});

final markAsPaiUseCaseProvider = Provider<IMarkAsPaidUseCase>((ref) {
  final repository = ref.watch(accountRepositoryProvider);
  return MarkAsPaidUseCase(repository);
});

final getAccountsUseCaseProvider = Provider<IGetAccountsUseCase>((ref) {
  final repository = ref.watch(accountRepositoryProvider);
  return GetAccountsUseCase(repository);
});

final getAccountsByFilterUseCaseProvider =
    Provider<IGetAccountsByFilterUseCase>((ref) {
  final repository = ref.watch(accountRepositoryProvider);
  return GetAccountsByFilterUseCase(repository);
});

final getCategoriesUseCaseProvider = Provider<IGetCategoriesUseCase>((ref) {
  final repository = ref.watch(accountRepositoryProvider);
  return GetCategoriesUseCase(repository);
});
