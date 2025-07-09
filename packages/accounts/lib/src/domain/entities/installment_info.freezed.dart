// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'installment_info.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$InstallmentInfo {
  int? get current => throw _privateConstructorUsedError;
  int? get total => throw _privateConstructorUsedError;

  /// Create a copy of InstallmentInfo
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $InstallmentInfoCopyWith<InstallmentInfo> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $InstallmentInfoCopyWith<$Res> {
  factory $InstallmentInfoCopyWith(
          InstallmentInfo value, $Res Function(InstallmentInfo) then) =
      _$InstallmentInfoCopyWithImpl<$Res, InstallmentInfo>;
  @useResult
  $Res call({int? current, int? total});
}

/// @nodoc
class _$InstallmentInfoCopyWithImpl<$Res, $Val extends InstallmentInfo>
    implements $InstallmentInfoCopyWith<$Res> {
  _$InstallmentInfoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of InstallmentInfo
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? current = freezed,
    Object? total = freezed,
  }) {
    return _then(_value.copyWith(
      current: freezed == current
          ? _value.current
          : current // ignore: cast_nullable_to_non_nullable
              as int?,
      total: freezed == total
          ? _value.total
          : total // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$InstallmentInfoImplCopyWith<$Res>
    implements $InstallmentInfoCopyWith<$Res> {
  factory _$$InstallmentInfoImplCopyWith(_$InstallmentInfoImpl value,
          $Res Function(_$InstallmentInfoImpl) then) =
      __$$InstallmentInfoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int? current, int? total});
}

/// @nodoc
class __$$InstallmentInfoImplCopyWithImpl<$Res>
    extends _$InstallmentInfoCopyWithImpl<$Res, _$InstallmentInfoImpl>
    implements _$$InstallmentInfoImplCopyWith<$Res> {
  __$$InstallmentInfoImplCopyWithImpl(
      _$InstallmentInfoImpl _value, $Res Function(_$InstallmentInfoImpl) _then)
      : super(_value, _then);

  /// Create a copy of InstallmentInfo
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? current = freezed,
    Object? total = freezed,
  }) {
    return _then(_$InstallmentInfoImpl(
      current: freezed == current
          ? _value.current
          : current // ignore: cast_nullable_to_non_nullable
              as int?,
      total: freezed == total
          ? _value.total
          : total // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc

class _$InstallmentInfoImpl extends _InstallmentInfo {
  const _$InstallmentInfoImpl({this.current, this.total}) : super._();

  @override
  final int? current;
  @override
  final int? total;

  @override
  String toString() {
    return 'InstallmentInfo(current: $current, total: $total)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$InstallmentInfoImpl &&
            (identical(other.current, current) || other.current == current) &&
            (identical(other.total, total) || other.total == total));
  }

  @override
  int get hashCode => Object.hash(runtimeType, current, total);

  /// Create a copy of InstallmentInfo
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$InstallmentInfoImplCopyWith<_$InstallmentInfoImpl> get copyWith =>
      __$$InstallmentInfoImplCopyWithImpl<_$InstallmentInfoImpl>(
          this, _$identity);
}

abstract class _InstallmentInfo extends InstallmentInfo {
  const factory _InstallmentInfo({final int? current, final int? total}) =
      _$InstallmentInfoImpl;
  const _InstallmentInfo._() : super._();

  @override
  int? get current;
  @override
  int? get total;

  /// Create a copy of InstallmentInfo
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$InstallmentInfoImplCopyWith<_$InstallmentInfoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
