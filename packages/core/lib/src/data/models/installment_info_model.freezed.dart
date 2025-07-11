// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'installment_info_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

InstallmentInfoModel _$InstallmentInfoModelFromJson(Map<String, dynamic> json) {
  return _InstallmentInfoModel.fromJson(json);
}

/// @nodoc
mixin _$InstallmentInfoModel {
  int? get current => throw _privateConstructorUsedError;
  int? get total => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $InstallmentInfoModelCopyWith<InstallmentInfoModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $InstallmentInfoModelCopyWith<$Res> {
  factory $InstallmentInfoModelCopyWith(InstallmentInfoModel value,
          $Res Function(InstallmentInfoModel) then) =
      _$InstallmentInfoModelCopyWithImpl<$Res, InstallmentInfoModel>;
  @useResult
  $Res call({int? current, int? total});
}

/// @nodoc
class _$InstallmentInfoModelCopyWithImpl<$Res,
        $Val extends InstallmentInfoModel>
    implements $InstallmentInfoModelCopyWith<$Res> {
  _$InstallmentInfoModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

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
abstract class _$$InstallmentInfoModelImplCopyWith<$Res>
    implements $InstallmentInfoModelCopyWith<$Res> {
  factory _$$InstallmentInfoModelImplCopyWith(_$InstallmentInfoModelImpl value,
          $Res Function(_$InstallmentInfoModelImpl) then) =
      __$$InstallmentInfoModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int? current, int? total});
}

/// @nodoc
class __$$InstallmentInfoModelImplCopyWithImpl<$Res>
    extends _$InstallmentInfoModelCopyWithImpl<$Res, _$InstallmentInfoModelImpl>
    implements _$$InstallmentInfoModelImplCopyWith<$Res> {
  __$$InstallmentInfoModelImplCopyWithImpl(_$InstallmentInfoModelImpl _value,
      $Res Function(_$InstallmentInfoModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? current = freezed,
    Object? total = freezed,
  }) {
    return _then(_$InstallmentInfoModelImpl(
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
@JsonSerializable()
class _$InstallmentInfoModelImpl extends _InstallmentInfoModel {
  const _$InstallmentInfoModelImpl({this.current, this.total}) : super._();

  factory _$InstallmentInfoModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$InstallmentInfoModelImplFromJson(json);

  @override
  final int? current;
  @override
  final int? total;

  @override
  String toString() {
    return 'InstallmentInfoModel(current: $current, total: $total)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$InstallmentInfoModelImpl &&
            (identical(other.current, current) || other.current == current) &&
            (identical(other.total, total) || other.total == total));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, current, total);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$InstallmentInfoModelImplCopyWith<_$InstallmentInfoModelImpl>
      get copyWith =>
          __$$InstallmentInfoModelImplCopyWithImpl<_$InstallmentInfoModelImpl>(
              this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$InstallmentInfoModelImplToJson(
      this,
    );
  }
}

abstract class _InstallmentInfoModel extends InstallmentInfoModel {
  const factory _InstallmentInfoModel({final int? current, final int? total}) =
      _$InstallmentInfoModelImpl;
  const _InstallmentInfoModel._() : super._();

  factory _InstallmentInfoModel.fromJson(Map<String, dynamic> json) =
      _$InstallmentInfoModelImpl.fromJson;

  @override
  int? get current;
  @override
  int? get total;
  @override
  @JsonKey(ignore: true)
  _$$InstallmentInfoModelImplCopyWith<_$InstallmentInfoModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}
