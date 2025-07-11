import 'package:dependencies/dependencies.dart';

part 'installment_info.freezed.dart';

@freezedNoHelpers
sealed class InstallmentInfo with _$InstallmentInfo {
  const InstallmentInfo._();
  const factory InstallmentInfo({
    int? current,
    int? total,
  }) = _InstallmentInfo;
}
