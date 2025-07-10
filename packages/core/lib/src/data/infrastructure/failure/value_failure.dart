import 'package:dependencies/dependencies.dart';

part 'value_failure.freezed.dart';

@freezedNoHelpers
sealed class ValueFailure<T> with _$ValueFailure<T> {
  const factory ValueFailure.invalidAmount({required T failedValue}) = InvalidAmount<T>;
}