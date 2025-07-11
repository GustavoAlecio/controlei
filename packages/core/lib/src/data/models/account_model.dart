import 'package:dependencies/dependencies.dart';

import '../../domain/domain.dart';
import 'enums/enums.dart';
import 'installment_info_model.dart';

part 'account_model.freezed.dart';
part 'account_model.g.dart';

@freezedNoHelpers
sealed class AccountModel with _$AccountModel {
  const AccountModel._();

  const factory AccountModel({
    @Default('') String id,
    @Default('') String name,
    @Default(0) int amount,
    required DateTime dueDate,
    @Default(AccountTypeModel.single) AccountTypeModel type,
    @Default(InstallmentInfoModel()) InstallmentInfoModel installmentInfo,
    @Default('') String category,
    @Default(PaymentStatusModel.pending) PaymentStatusModel status,
  }) = _AccountModel;

  factory AccountModel.fromJson(Map<String, dynamic> json) =>
      _$AccountModelFromJson(json);

  factory AccountModel.fromEntity(Account entity) {
    return AccountModel(
      id: entity.id,
      name: entity.name,
      amount: (entity.amount.value * 100).toInt(),
      dueDate: entity.dueDate,
      type: entity.type.toModel,
      installmentInfo: InstallmentInfoModel.fromEntity(entity.installmentInfo),
      category: entity.category,
      status: entity.status.toModel,
    );
  }

  Account toEntity() {
    return Account(
      id: id,
      name: name,
      amount: Amount(amount / 100),
      dueDate: dueDate,
      type: type.toEntity,
      installmentInfo: installmentInfo.toEntity(),
      category: category,
      status: status.toEntity,
    );
  }
}
