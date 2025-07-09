import 'package:accounts/accounts.dart';

extension PaymentStatusExtensions on PaymentStatus {
  String get name => switch (this) {
        PaymentStatus.paid => 'Pago',
        PaymentStatus.pending => 'Pendente',
        PaymentStatus.overdue => 'Vencido',
      };
}
