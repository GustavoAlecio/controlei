import 'package:design_system/design_system.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('AppColors', () {
    test('primary color is correct', () {
      expect(AppColors.primary.value, 0xFF0057B7);
    });

    test('error color is correct', () {
      expect(AppColors.error.value, 0xFFE53935);
    });
  });
}
