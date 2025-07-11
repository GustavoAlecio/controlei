import 'package:core/core.dart';
import 'package:dependencies/dependencies.dart';


part 'account.freezed.dart';

@freezedNoHelpers
sealed class Account with _$Account {
  const Account._();
   factory Account({
    @Default('') String id,
    @Default('') String name,
    @Default(Amount.zero) Amount amount,
    required DateTime dueDate,
    @Default(AccountType.single) AccountType type,
    @Default(InstallmentInfo()) InstallmentInfo installmentInfo,
    @Default('') String category,
    @Default(PaymentStatus.pending) PaymentStatus status,
  }) = _Account;
}
