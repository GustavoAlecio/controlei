import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('AppTextStyles', () {
    test('displayLarge has correct font size', () {
      expect(AppTextStyles.displayLarge.fontSize, 32);
    });

    test('labelSmall is italic', () {
      expect(AppTextStyles.labelSmall.fontStyle, FontStyle.italic);
    });
  });
}
