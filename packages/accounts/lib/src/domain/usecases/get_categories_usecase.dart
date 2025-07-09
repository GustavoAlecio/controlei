import 'package:accounts/accounts.dart';
import 'package:core/core.dart';

abstract interface class IGetCategoriesUseCase{
  Future<Either<Failure, List<String>>> call();
}

final class GetCategoriesUseCase implements IGetCategoriesUseCase{
  final IAccountRepository _repository;

  GetCategoriesUseCase(this._repository);

  @override
  Future<Either<Failure, List<String>>> call() async {
   return await _repository.getCategories();
  }

}