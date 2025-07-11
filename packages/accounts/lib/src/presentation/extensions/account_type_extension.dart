import 'package:core/core.dart';

extension AccountTypeExtension on AccountType {
  String get name => switch (this) {
        AccountType.single => 'Único',
        AccountType.installment => 'Parcelado',
        AccountType.recurring => 'Recorrente',
      };
}
