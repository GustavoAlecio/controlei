// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'installment_info_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$InstallmentInfoModelImpl _$$InstallmentInfoModelImplFromJson(
        Map<String, dynamic> json) =>
    _$InstallmentInfoModelImpl(
      current: (json['current'] as num?)?.toInt(),
      total: (json['total'] as num?)?.toInt(),
    );

Map<String, dynamic> _$$InstallmentInfoModelImplToJson(
        _$InstallmentInfoModelImpl instance) =>
    <String, dynamic>{
      'current': instance.current,
      'total': instance.total,
    };
