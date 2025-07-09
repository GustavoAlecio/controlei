import 'package:dependencies/dependencies.dart';

part 'either_infrastructure.freezed.dart';

@freezedNoHelpers
sealed class Either<L, R> with _$Either<L, R> {
  const Either._();

  const factory Either.left(L value) = Left<L, R>;
  const factory Either.right(R value) = Right<L, R>;

  T fold<T>(T Function(L l) ifLeft, T Function(R r) ifRight) {
    return switch (this) {
      Left(value: final l) => ifLeft(l),
      Right(value: final r) => ifRight(r),
    };
  }

  bool get isLeft => this is Left<L, R>;
  bool get isRight => this is Right<L, R>;

  R? toRight() => switch (this) {
        Right(value: final r) => r,
        Left() => null,
      };

  L? toLeft() => switch (this) {
        Left(value: final l) => l,
        Right() => null,
      };
}
