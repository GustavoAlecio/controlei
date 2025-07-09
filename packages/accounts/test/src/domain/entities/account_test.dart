import 'package:flutter_test/flutter_test.dart';
import 'package:accounts/src/domain/domain.dart';

void main() {
  group('Account', () {
    test('should create a valid account with required fields', () {
      final account = Account(
        dueDate: DateTime(2025, 7, 1),
      );

      expect(account.id, '');
      expect(account.name, '');
      expect(account.amount, 0);
      expect(account.dueDate, DateTime(2025, 7, 1));
      expect(account.type, AccountType.single);
      expect(account.installmentInfo.current, isNull);
      expect(account.installmentInfo.total, isNull);
      expect(account.category, '');
      expect(account.status, PaymentStatus.pending);
    });

    test('should support equality comparison (freezed)', () {
      final a = Account(dueDate: DateTime(2025, 7, 1));
      final b = Account(dueDate: DateTime(2025, 7, 1));

      expect(a, equals(b));
    });

    test('should update fields using copyWith', () {
      final account = Account(
        dueDate: DateTime(2025, 7, 1),
        amount: 100.0,
      );

      final updated = account.copyWith(
        name: 'Electricity Bill',
        amount: 150.0,
        status: PaymentStatus.paid,
      );

      expect(updated.name, 'Electricity Bill');
      expect(updated.amount, 150.0);
      expect(updated.status, PaymentStatus.paid);
      expect(updated.dueDate, DateTime(2025, 7, 1));
    });
  });
}
