import 'package:dependencies/dependencies.dart';

import 'enums/enums.dart';

part 'account_filter.freezed.dart';

@freezedNoHelpers
sealed class AccountFilter with _$AccountFilter {
  const AccountFilter._();
  const factory AccountFilter({
    AccountType? type,
    PaymentStatus? status,
    DateTime? month,
    String? category,
  }) = _AccountFilter;

  bool get selectedType => type != null;
  bool get selectedStatus => status != null;
  bool get selectedMonth => month != null;
  bool get selectedCategory => category != null;
}
