import 'package:dependencies/dependencies.dart';

import '../../domain/domain.dart';

part 'installment_info_model.freezed.dart';
part 'installment_info_model.g.dart';

@freezedNoHelpers
sealed class InstallmentInfoModel with _$InstallmentInfoModel {
  const InstallmentInfoModel._();
  const factory InstallmentInfoModel({
    int? current,
    int? total,
  }) = _InstallmentInfoModel;

  factory InstallmentInfoModel.fromJson(Map<String, dynamic> json) =>
      _$InstallmentInfoModelFromJson(json);

  factory InstallmentInfoModel.fromEntity(InstallmentInfo entity) {
    return InstallmentInfoModel(
      current: entity.current,
      total: entity.total,
    );
  }

  InstallmentInfo toEntity() {
    return InstallmentInfo(
      current: current,
      total: total,
    );
  }
}
