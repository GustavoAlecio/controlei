import 'package:flutter_test/flutter_test.dart';
import 'package:accounts/src/domain/domain.dart';

void main() {
  group('AccountFilter', () {
    test('should have all fields null by default', () {
      const filter = AccountFilter();

      expect(filter.type, isNull);
      expect(filter.status, isNull);
      expect(filter.month, isNull);
      expect(filter.category, isNull);

      expect(filter.selectedType, isFalse);
      expect(filter.selectedStatus, isFalse);
      expect(filter.selectedMonth, isFalse);
      expect(filter.selectedCategory, isFalse);
    });

    test('should reflect selected fields correctly', () {
      final filter = AccountFilter(
        type: AccountType.recurring,
        status: PaymentStatus.paid,
        month: DateTime(2025, 7),
        category: 'Food',
      );

      expect(filter.selectedType, isTrue);
      expect(filter.selectedStatus, isTrue);
      expect(filter.selectedMonth, isTrue);
      expect(filter.selectedCategory, isTrue);
    });

    test('should support equality', () {
      final a = AccountFilter(
        type: AccountType.single,
        status: PaymentStatus.pending,
        month: DateTime(2025, 7),
        category: 'Housing',
      );

      final b = AccountFilter(
        type: AccountType.single,
        status: PaymentStatus.pending,
        month: DateTime(2025, 7),
        category: 'Housing',
      );

      expect(a, equals(b));
    });

    test('copyWith should override only specified fields', () {
      const base = AccountFilter(status: PaymentStatus.pending);

      final updated = base.copyWith(category: 'Health');

      expect(updated.status, PaymentStatus.pending);
      expect(updated.category, 'Health');
      expect(updated.type, isNull);
      expect(updated.selectedStatus, isTrue);
      expect(updated.selectedCategory, isTrue);
    });
  });
}
