import 'package:dependencies/dependencies.dart';

import '../../../domain/domain.dart';

enum AccountTypeModel {
  @JsonValue('single')
  single,

  @JsonValue('installment')
  installment,

  @JsonValue('recurring')
  recurring,
}

extension AccountTypeModelExtension on AccountTypeModel {
  AccountType get toEntity {
    return switch (this) {
      AccountTypeModel.single => AccountType.single,
      AccountTypeModel.installment => AccountType.installment,
      AccountTypeModel.recurring => AccountType.recurring,
    };
  }
}

extension AccountTypeExtension on AccountType {
  AccountTypeModel get toModel => switch (this) {
    AccountType.single => AccountTypeModel.single,
    AccountType.installment => AccountTypeModel.installment,
    AccountType.recurring => AccountTypeModel.recurring,
  };
}


