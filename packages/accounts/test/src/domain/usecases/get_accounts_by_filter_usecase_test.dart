import 'package:flutter_test/flutter_test.dart';
import 'package:core/core.dart';
import 'package:accounts/src/domain/domain.dart';
import 'package:mockito/mockito.dart';

import '../../../mocks/mocks.mocks.dart';

void main() {
  provideDummy<Either<Failure, List<Account>>>(const Right([]));
  provideDummy<AccountFilter>(const AccountFilter());

  late MockIAccountRepository mockRepository;
  late GetAccountsByFilterUseCase useCase;

  setUp(() {
    mockRepository = MockIAccountRepository();
    useCase = GetAccountsByFilterUseCase(mockRepository);
  });

  group('GetAccountsByFilterUseCase', () {
    const filter = AccountFilter();

    test('should return filtered accounts when successful', () async {
      when(mockRepository.getAccountsByFilter(filter))
          .thenAnswer((_) async => const Right([]));

      final result = await useCase(filter);

      expect(result.isRight, isTrue);
      verify(mockRepository.getAccountsByFilter(filter)).called(1);
      verifyNoMoreInteractions(mockRepository);
    });

    test('should return Failure when repository fails', () async {
      const failure = Failure.unknown(message: 'error');

      when(mockRepository.getAccountsByFilter(filter))
          .thenAnswer((_) async => const Left(failure));

      final result = await useCase(filter);

      expect(result.isLeft, isTrue);
      expect(result.fold((l) => l, (_) => null), failure);
      verify(mockRepository.getAccountsByFilter(filter)).called(1);
      verifyNoMoreInteractions(mockRepository);
    });
  });
}
