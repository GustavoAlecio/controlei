import 'package:flutter_test/flutter_test.dart';
import 'package:core/core.dart';
import 'package:accounts/src/domain/domain.dart';
import 'package:mockito/mockito.dart';

import '../../../mocks/mocks.mocks.dart';

void main() {
  provideDummy<Either<Failure, List<Account>>>(const Right([]));

  late MockIAccountRepository mockRepository;
  late IGetAccountsUseCase useCase;

  setUp(() {
    mockRepository = MockIAccountRepository();
    useCase = GetAccountsUseCase(mockRepository);
  });

  group('GetAccountsUseCase', () {
    test('should return list of accounts when successful', () async {
      when(mockRepository.getAll())
          .thenAnswer((_) async => const Right([]));

      final result = await useCase();

      expect(result.isRight, isTrue);
      verify(mockRepository.getAll()).called(1);
      verifyNoMoreInteractions(mockRepository);
    });

    test('should return Failure when repository fails', () async {
      const failure = Failure.unknown(message: 'error');

      when(mockRepository.getAll())
          .thenAnswer((_) async => const Left(failure));

      final result = await useCase();

      expect(result.isLeft, isTrue);
      expect(result.fold((l) => l, (_) => null), failure);
      verify(mockRepository.getAll()).called(1);
      verifyNoMoreInteractions(mockRepository);
    });
  });
}
