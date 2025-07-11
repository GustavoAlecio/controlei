import 'package:core/core.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('InstallmentInfo', () {
    test('should allow null values by default', () {
      const info = InstallmentInfoModel();

      expect(info.current, isNull);
      expect(info.total, isNull);
    });

    test('should allow custom values', () {
      const info = InstallmentInfoModel(current: 1, total: 12);

      expect(info.current, 1);
      expect(info.total, 12);
    });

    test('should support equality (freezed)', () {
      const a = InstallmentInfoModel(current: 1, total: 12);
      const b = InstallmentInfoModel(current: 1, total: 12);

      expect(a, equals(b));
    });

    test('should allow partial updates with copyWith', () {
      const base = InstallmentInfoModel(current: 2);

      final updated = base.copyWith(total: 5);

      expect(updated.current, 2);
      expect(updated.total, 5);
    });
  });
}
