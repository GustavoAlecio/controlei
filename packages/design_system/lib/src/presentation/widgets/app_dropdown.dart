import 'package:flutter/material.dart';

class AppDropdown<T> extends StatelessWidget {
  final String label;
  final T? value;
  final List<T> items;
  final String Function(T) itemBuilder;
  final ValueChanged<T?> onChanged;

  const AppDropdown({
    super.key,
    required this.label,
    required this.value,
    required this.items,
    required this.itemBuilder,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return InputDecorator(
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
      child: DropdownButtonHideUnderline(
        child: DropdownButton<T>(
          value: value,
          isExpanded: true,
          onChanged: onChanged,
          items: items
              .map((e) => DropdownMenuItem<T>(
            value: e,
            child: Text(itemBuilder(e)),
          ))
              .toList(),
        ),
      ),
    );
  }
}
