// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'account_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

AccountModel _$AccountModelFromJson(Map<String, dynamic> json) {
  return _AccountModel.fromJson(json);
}

/// @nodoc
mixin _$AccountModel {
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  int get amount => throw _privateConstructorUsedError;
  DateTime get dueDate => throw _privateConstructorUsedError;
  AccountTypeModel get type => throw _privateConstructorUsedError;
  InstallmentInfoModel get installmentInfo =>
      throw _privateConstructorUsedError;
  String get category => throw _privateConstructorUsedError;
  PaymentStatusModel get status => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AccountModelCopyWith<AccountModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AccountModelCopyWith<$Res> {
  factory $AccountModelCopyWith(
          AccountModel value, $Res Function(AccountModel) then) =
      _$AccountModelCopyWithImpl<$Res, AccountModel>;
  @useResult
  $Res call(
      {String id,
      String name,
      int amount,
      DateTime dueDate,
      AccountTypeModel type,
      InstallmentInfoModel installmentInfo,
      String category,
      PaymentStatusModel status});

  $InstallmentInfoModelCopyWith<$Res> get installmentInfo;
}

/// @nodoc
class _$AccountModelCopyWithImpl<$Res, $Val extends AccountModel>
    implements $AccountModelCopyWith<$Res> {
  _$AccountModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? amount = null,
    Object? dueDate = null,
    Object? type = null,
    Object? installmentInfo = null,
    Object? category = null,
    Object? status = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      amount: null == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as int,
      dueDate: null == dueDate
          ? _value.dueDate
          : dueDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as AccountTypeModel,
      installmentInfo: null == installmentInfo
          ? _value.installmentInfo
          : installmentInfo // ignore: cast_nullable_to_non_nullable
              as InstallmentInfoModel,
      category: null == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as PaymentStatusModel,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $InstallmentInfoModelCopyWith<$Res> get installmentInfo {
    return $InstallmentInfoModelCopyWith<$Res>(_value.installmentInfo, (value) {
      return _then(_value.copyWith(installmentInfo: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$AccountModelImplCopyWith<$Res>
    implements $AccountModelCopyWith<$Res> {
  factory _$$AccountModelImplCopyWith(
          _$AccountModelImpl value, $Res Function(_$AccountModelImpl) then) =
      __$$AccountModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String name,
      int amount,
      DateTime dueDate,
      AccountTypeModel type,
      InstallmentInfoModel installmentInfo,
      String category,
      PaymentStatusModel status});

  @override
  $InstallmentInfoModelCopyWith<$Res> get installmentInfo;
}

/// @nodoc
class __$$AccountModelImplCopyWithImpl<$Res>
    extends _$AccountModelCopyWithImpl<$Res, _$AccountModelImpl>
    implements _$$AccountModelImplCopyWith<$Res> {
  __$$AccountModelImplCopyWithImpl(
      _$AccountModelImpl _value, $Res Function(_$AccountModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? amount = null,
    Object? dueDate = null,
    Object? type = null,
    Object? installmentInfo = null,
    Object? category = null,
    Object? status = null,
  }) {
    return _then(_$AccountModelImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      amount: null == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as int,
      dueDate: null == dueDate
          ? _value.dueDate
          : dueDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as AccountTypeModel,
      installmentInfo: null == installmentInfo
          ? _value.installmentInfo
          : installmentInfo // ignore: cast_nullable_to_non_nullable
              as InstallmentInfoModel,
      category: null == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as PaymentStatusModel,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AccountModelImpl extends _AccountModel {
  const _$AccountModelImpl(
      {this.id = '',
      this.name = '',
      this.amount = 0,
      required this.dueDate,
      this.type = AccountTypeModel.single,
      this.installmentInfo = const InstallmentInfoModel(),
      this.category = '',
      this.status = PaymentStatusModel.pending})
      : super._();

  factory _$AccountModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$AccountModelImplFromJson(json);

  @override
  @JsonKey()
  final String id;
  @override
  @JsonKey()
  final String name;
  @override
  @JsonKey()
  final int amount;
  @override
  final DateTime dueDate;
  @override
  @JsonKey()
  final AccountTypeModel type;
  @override
  @JsonKey()
  final InstallmentInfoModel installmentInfo;
  @override
  @JsonKey()
  final String category;
  @override
  @JsonKey()
  final PaymentStatusModel status;

  @override
  String toString() {
    return 'AccountModel(id: $id, name: $name, amount: $amount, dueDate: $dueDate, type: $type, installmentInfo: $installmentInfo, category: $category, status: $status)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AccountModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.amount, amount) || other.amount == amount) &&
            (identical(other.dueDate, dueDate) || other.dueDate == dueDate) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.installmentInfo, installmentInfo) ||
                other.installmentInfo == installmentInfo) &&
            (identical(other.category, category) ||
                other.category == category) &&
            (identical(other.status, status) || other.status == status));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, name, amount, dueDate, type,
      installmentInfo, category, status);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AccountModelImplCopyWith<_$AccountModelImpl> get copyWith =>
      __$$AccountModelImplCopyWithImpl<_$AccountModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AccountModelImplToJson(
      this,
    );
  }
}

abstract class _AccountModel extends AccountModel {
  const factory _AccountModel(
      {final String id,
      final String name,
      final int amount,
      required final DateTime dueDate,
      final AccountTypeModel type,
      final InstallmentInfoModel installmentInfo,
      final String category,
      final PaymentStatusModel status}) = _$AccountModelImpl;
  const _AccountModel._() : super._();

  factory _AccountModel.fromJson(Map<String, dynamic> json) =
      _$AccountModelImpl.fromJson;

  @override
  String get id;
  @override
  String get name;
  @override
  int get amount;
  @override
  DateTime get dueDate;
  @override
  AccountTypeModel get type;
  @override
  InstallmentInfoModel get installmentInfo;
  @override
  String get category;
  @override
  PaymentStatusModel get status;
  @override
  @JsonKey(ignore: true)
  _$$AccountModelImplCopyWith<_$AccountModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
