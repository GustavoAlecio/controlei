part 'amount.dart';

sealed class ValueObject<T> {
  const ValueObject();

  T get value;

  @override
  String toString() => value.toString();

  @override
  bool operator ==(Object other) {
    return other is ValueObject<T> && other.value == value;
  }

  @override
  int get hashCode => value.hashCode;
}
