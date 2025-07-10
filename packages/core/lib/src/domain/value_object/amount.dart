part of 'value_object.dart';

final class Amount extends ValueObject<double> {
  @override
  final double value;

  const Amount._(this.value);

  factory Amount(double input) {
    if (input < 0) {
      throw ArgumentError.value(input, 'Amount', 'must not be negative');
    }
    return Amount._(input);
  }

  static const Amount zero = Amount._(0);

  bool get isZero => value == 0;
  double get toDouble => value;

  @override
  String toString() => 'R\$ ${value.toStringAsFixed(2)}';

  factory Amount.fromText(String value){
    final text = value
        .replaceAll(RegExp(r'[^\d,.]'), '')
        .replaceAll('.', '')
        .replaceAll(',', '.');
    final amount = double.tryParse(text) ?? 0.0;
    return Amount(amount);
  }
}
