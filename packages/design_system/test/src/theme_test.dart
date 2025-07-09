import 'package:design_system/design_system.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('AppTheme', () {
    testWidgets('appTheme primaryColor matches AppColors.primary',
        (tester) async {
      final theme = appTheme;
      expect(theme.primaryColor, AppColors.primary);
    });

    testWidgets('textTheme displayLarge uses AppTextStyles.displayLarge',
        (tester) async {
      final theme = appTheme;
      expect(theme.textTheme.displayLarge?.fontSize,
          AppTextStyles.displayLarge.fontSize);
    });
  });
}
