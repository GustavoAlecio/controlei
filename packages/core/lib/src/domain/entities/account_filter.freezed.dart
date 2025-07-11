// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'account_filter.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$AccountFilter {
  AccountType? get type => throw _privateConstructorUsedError;
  PaymentStatus? get status => throw _privateConstructorUsedError;
  DateTime? get month => throw _privateConstructorUsedError;
  String? get category => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $AccountFilterCopyWith<AccountFilter> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AccountFilterCopyWith<$Res> {
  factory $AccountFilterCopyWith(
          AccountFilter value, $Res Function(AccountFilter) then) =
      _$AccountFilterCopyWithImpl<$Res, AccountFilter>;
  @useResult
  $Res call(
      {AccountType? type,
      PaymentStatus? status,
      DateTime? month,
      String? category});
}

/// @nodoc
class _$AccountFilterCopyWithImpl<$Res, $Val extends AccountFilter>
    implements $AccountFilterCopyWith<$Res> {
  _$AccountFilterCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? type = freezed,
    Object? status = freezed,
    Object? month = freezed,
    Object? category = freezed,
  }) {
    return _then(_value.copyWith(
      type: freezed == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as AccountType?,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as PaymentStatus?,
      month: freezed == month
          ? _value.month
          : month // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      category: freezed == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AccountFilterImplCopyWith<$Res>
    implements $AccountFilterCopyWith<$Res> {
  factory _$$AccountFilterImplCopyWith(
          _$AccountFilterImpl value, $Res Function(_$AccountFilterImpl) then) =
      __$$AccountFilterImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {AccountType? type,
      PaymentStatus? status,
      DateTime? month,
      String? category});
}

/// @nodoc
class __$$AccountFilterImplCopyWithImpl<$Res>
    extends _$AccountFilterCopyWithImpl<$Res, _$AccountFilterImpl>
    implements _$$AccountFilterImplCopyWith<$Res> {
  __$$AccountFilterImplCopyWithImpl(
      _$AccountFilterImpl _value, $Res Function(_$AccountFilterImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? type = freezed,
    Object? status = freezed,
    Object? month = freezed,
    Object? category = freezed,
  }) {
    return _then(_$AccountFilterImpl(
      type: freezed == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as AccountType?,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as PaymentStatus?,
      month: freezed == month
          ? _value.month
          : month // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      category: freezed == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$AccountFilterImpl extends _AccountFilter {
  const _$AccountFilterImpl({this.type, this.status, this.month, this.category})
      : super._();

  @override
  final AccountType? type;
  @override
  final PaymentStatus? status;
  @override
  final DateTime? month;
  @override
  final String? category;

  @override
  String toString() {
    return 'AccountFilter(type: $type, status: $status, month: $month, category: $category)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AccountFilterImpl &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.month, month) || other.month == month) &&
            (identical(other.category, category) ||
                other.category == category));
  }

  @override
  int get hashCode => Object.hash(runtimeType, type, status, month, category);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AccountFilterImplCopyWith<_$AccountFilterImpl> get copyWith =>
      __$$AccountFilterImplCopyWithImpl<_$AccountFilterImpl>(this, _$identity);
}

abstract class _AccountFilter extends AccountFilter {
  const factory _AccountFilter(
      {final AccountType? type,
      final PaymentStatus? status,
      final DateTime? month,
      final String? category}) = _$AccountFilterImpl;
  const _AccountFilter._() : super._();

  @override
  AccountType? get type;
  @override
  PaymentStatus? get status;
  @override
  DateTime? get month;
  @override
  String? get category;
  @override
  @JsonKey(ignore: true)
  _$$AccountFilterImplCopyWith<_$AccountFilterImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
