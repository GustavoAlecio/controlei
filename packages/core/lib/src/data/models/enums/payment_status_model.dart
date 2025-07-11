import 'package:core/core.dart';
import 'package:dependencies/dependencies.dart';

enum PaymentStatusModel {
  @JsonValue('pending')
  pending,
  @JsonValue('paid')
  paid,
  @JsonValue('overdue')
  overdue,
}

extension PaymentStatusModelExtension on PaymentStatusModel {
  PaymentStatus get toEntity => switch (this) {
        PaymentStatusModel.pending => PaymentStatus.pending,
        PaymentStatusModel.paid => PaymentStatus.paid,
        PaymentStatusModel.overdue => PaymentStatus.overdue,
      };
}
extension PaymentStatusExtension on PaymentStatus {
  PaymentStatusModel get toModel => switch (this) {
    PaymentStatus.pending => PaymentStatusModel.pending,
    PaymentStatus.paid => PaymentStatusModel.paid,
    PaymentStatus.overdue => PaymentStatusModel.overdue,
  };
}
