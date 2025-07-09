import 'package:flutter_test/flutter_test.dart';
import 'package:core/core.dart';
import 'package:accounts/src/domain/domain.dart';
import 'package:mockito/mockito.dart';

import '../../../mocks/mocks.mocks.dart';

void main() {
  provideDummy<Either<Failure, void>>(const Right(null));

  late MockIAccountRepository mockRepository;
  late IUpdateAccountUseCase useCase;

  setUp(() {
    mockRepository = MockIAccountRepository();
    useCase = UpdateAccountUseCase(mockRepository);
  });

  group('UpdateAccountUseCase', () {
    final account = Account(dueDate: DateTime(2025, 7, 1));

    test('should update account successfully', () async {
      when(mockRepository.updateAccount(account))
          .thenAnswer((_) async => const Right(null));

      final result = await useCase(account);

      expect(result.isRight, isTrue);
      verify(mockRepository.updateAccount(account)).called(1);
      verifyNoMoreInteractions(mockRepository);
    });

    test('should return Failure on repository error', () async {
      const failure = Failure.unknown(message: 'error');

      when(mockRepository.updateAccount(account))
          .thenAnswer((_) async => const Left(failure));

      final result = await useCase(account);

      expect(result.isLeft, isTrue);
      expect(result.fold((l) => l, (_) => null), failure);
      verify(mockRepository.updateAccount(account)).called(1);
      verifyNoMoreInteractions(mockRepository);
    });
  });
}
