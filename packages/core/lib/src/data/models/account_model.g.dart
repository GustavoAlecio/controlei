// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'account_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AccountModelImpl _$$AccountModelImplFromJson(Map<String, dynamic> json) =>
    _$AccountModelImpl(
      id: json['id'] as String? ?? '',
      name: json['name'] as String? ?? '',
      amount: (json['amount'] as num?)?.toInt() ?? 0,
      dueDate: DateTime.parse(json['dueDate'] as String),
      type: $enumDecodeNullable(_$AccountTypeModelEnumMap, json['type']) ??
          AccountTypeModel.single,
      installmentInfo: json['installmentInfo'] == null
          ? const InstallmentInfoModel()
          : InstallmentInfoModel.fromJson(
              json['installmentInfo'] as Map<String, dynamic>),
      category: json['category'] as String? ?? '',
      status:
          $enumDecodeNullable(_$PaymentStatusModelEnumMap, json['status']) ??
              PaymentStatusModel.pending,
    );

Map<String, dynamic> _$$AccountModelImplToJson(_$AccountModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'amount': instance.amount,
      'dueDate': instance.dueDate.toIso8601String(),
      'type': _$AccountTypeModelEnumMap[instance.type]!,
      'installmentInfo': instance.installmentInfo,
      'category': instance.category,
      'status': _$PaymentStatusModelEnumMap[instance.status]!,
    };

const _$AccountTypeModelEnumMap = {
  AccountTypeModel.single: 'single',
  AccountTypeModel.installment: 'installment',
  AccountTypeModel.recurring: 'recurring',
};

const _$PaymentStatusModelEnumMap = {
  PaymentStatusModel.pending: 'pending',
  PaymentStatusModel.paid: 'paid',
  PaymentStatusModel.overdue: 'overdue',
};
