import 'package:flutter_test/flutter_test.dart';
import 'package:core/core.dart';
import 'package:accounts/src/domain/domain.dart';
import 'package:mockito/mockito.dart';

import '../../../mocks/mocks.mocks.dart';

void main() {
  provideDummy<Either<Failure, void>>(const Right(null));

  late MockIAccountRepository mockRepository;
  late IMarkAsPaidUseCase useCase;

  setUp(() {
    mockRepository = MockIAccountRepository();
    useCase = MarkAsPaidUseCase(mockRepository);
  });

  group('MarkAsPaidUseCase', () {
    const id = 'abc';

    test('should mark account as paid successfully', () async {
      when(mockRepository.markAsPaid(id))
          .thenAnswer((_) async => const Right(null));

      final result = await useCase(id);

      expect(result.isRight, isTrue);
      verify(mockRepository.markAsPaid(id)).called(1);
      verifyNoMoreInteractions(mockRepository);
    });

    test('should return Failure when repository fails', () async {
      const failure = Failure.unknown(message: 'error');

      when(mockRepository.markAsPaid(id))
          .thenAnswer((_) async => const Left(failure));

      final result = await useCase(id);

      expect(result.isLeft, isTrue);
      expect(result.fold((l) => l, (_) => null), failure);
      verify(mockRepository.markAsPaid(id)).called(1);
      verifyNoMoreInteractions(mockRepository);
    });
  });
}
