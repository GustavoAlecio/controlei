import 'package:flutter/material.dart';

class AppInput extends StatelessWidget {
  final TextEditingController controller;
  final String label;
  final TextInputType? keyboardType;
  final String? Function(String?)? validator;

  const AppInput({
    super.key,
    required this.controller,
    required this.label,
    this.keyboardType,
    this.validator,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return TextFormField(
      controller: controller,
      keyboardType: keyboardType,
      validator: validator,
      cursorHeight: 30,
      style: theme.textTheme.labelLarge?.copyWith(
        color: theme.colorScheme.onSurface,
      ),
      decoration: InputDecoration(
        constraints:const BoxConstraints(
          maxHeight: 50,
          minHeight: 50,
          maxWidth: 200,
          minWidth: 150,
        ),
        labelText: label,
        labelStyle: theme.textTheme.labelLarge?.copyWith(
          color: theme.colorScheme.onSurface,
        ),
        border: const OutlineInputBorder(),
      ),
    );
  }
}
