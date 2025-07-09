import 'package:flutter_test/flutter_test.dart';
import 'package:core/core.dart';
import 'package:accounts/src/domain/domain.dart';
import 'package:mockito/mockito.dart';

import '../../../mocks/mocks.mocks.dart';

void main() {
  provideDummy<Either<Failure, void>>(const Right(null));

  late MockIAccountRepository mockRepository;
  late IDeleteAccountUseCase useCase;

  setUp(() {
    mockRepository = MockIAccountRepository();
    useCase = DeleteAccountUseCase(mockRepository);
  });

  group('DeleteAccountUseCase', () {
    const id = '123';

    test('should delete account successfully', () async {
      when(mockRepository.deleteAccount(id))
          .thenAnswer((_) async => const Right(null));

      final result = await useCase(id);

      expect(result.isRight, isTrue);
      verify(mockRepository.deleteAccount(id)).called(1);
      verifyNoMoreInteractions(mockRepository);
    });

    test('should return Failure on repository error', () async {
      const failure = Failure.unknown(message: 'error');

      when(mockRepository.deleteAccount(id))
          .thenAnswer((_) async => const Left(failure));

      final result = await useCase(id);

      expect(result.isLeft, isTrue);
      expect(result.fold((l) => l, (_) => null), failure);
      verify(mockRepository.deleteAccount(id)).called(1);
      verifyNoMoreInteractions(mockRepository);
    });
  });
}
