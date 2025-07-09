import 'package:dependencies/dependencies.dart';

import '../../domain/domain.dart';

part 'account_state.freezed.dart';

@freezedNoHelpers
sealed class AccountState with _$AccountState {
  const AccountState._();
  const factory AccountState({
    @Default([]) List<Account> accounts,
    @Default([]) List<String> categories,
  }) = _AccountState;
}
