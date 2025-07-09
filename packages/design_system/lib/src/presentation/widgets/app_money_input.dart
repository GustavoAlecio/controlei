import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';

class AppMoneyInput extends StatefulWidget {
  final String label;
  final TextEditingController controller;
  final String? Function(String?)? validator;
  final void Function(double value)? onChanged;

  const AppMoneyInput({
    super.key,
    required this.label,
    required this.controller,
    this.validator,
    this.onChanged,
  });

  @override
  State<AppMoneyInput> createState() => _AppMoneyInputState();
}

class _AppMoneyInputState extends State<AppMoneyInput> {
  final NumberFormat _formatter = NumberFormat.currency(locale: 'pt_BR', symbol: 'R\$');
  String _lastValue = '';

  @override
  void initState() {
    super.initState();
    widget.controller.addListener(_formatInput);
  }

  @override
  void dispose() {
    widget.controller.removeListener(_formatInput);
    super.dispose();
  }

  void _formatInput() {
    final rawText = widget.controller.text.replaceAll(RegExp(r'[^0-9]'), '');
    if (rawText == _lastValue) return;

    _lastValue = rawText;
    if (rawText.isEmpty) {
      widget.controller.text = '';
      return;
    }

    final double value = double.parse(rawText) / 100;
    final formatted = _formatter.format(value);

    widget.controller
      ..text = formatted
      ..selection = TextSelection.collapsed(offset: formatted.length);

    if (widget.onChanged != null) {
      widget.onChanged!(value);
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return TextFormField(
      controller: widget.controller,
      keyboardType: TextInputType.number,
      inputFormatters: [
        FilteringTextInputFormatter.digitsOnly,
      ],
      validator: widget.validator,
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
        labelText: widget.label,
        labelStyle: theme.textTheme.labelLarge?.copyWith(
          color: theme.colorScheme.onSurface,
        ),
        border: const OutlineInputBorder(),
      ),
    );
  }
}
