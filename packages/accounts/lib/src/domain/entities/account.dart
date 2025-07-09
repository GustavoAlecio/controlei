import 'package:dependencies/dependencies.dart';

import './enums/enums.dart';
import 'installment_info.dart';

part 'account.freezed.dart';

@freezedNoHelpers
sealed class Account with _$Account {
  const Account._();
  const factory Account({
    @Default('') String id,
    @Default('') String name,
    @Default(0) double amount,
    required DateTime dueDate,
    @Default(AccountType.single) AccountType type,
    @Default(InstallmentInfo()) InstallmentInfo installmentInfo,
    @Default('') String category,
    @Default(PaymentStatus.pending) PaymentStatus status,
  }) = _Account;
}
