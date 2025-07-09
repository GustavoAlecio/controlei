import 'package:flutter_test/flutter_test.dart';
import 'package:core/core.dart';
import 'package:accounts/src/domain/domain.dart';
import 'package:mockito/mockito.dart';

import '../../../mocks/mocks.mocks.dart';

void main() {
  provideDummy<Either<Failure, void>>(const Either.right(null));
  late MockIAccountRepository mockRepository;
  late CreateAccountUseCase useCase;

  setUp(() {
    mockRepository = MockIAccountRepository();
    useCase = CreateAccountUseCase(mockRepository);
  });

  group('CreateAccountUseCase', () {
    final account = Account(dueDate: DateTime(2025, 7, 1));

    test('should create account and return Right(void) when successful',
        () async {
      // Arrange
      when(mockRepository.createAccount(account))
          .thenAnswer((_) async => const Right(null));

      // Act
      final result = await useCase(account);

      // Assert
      expect(result.isRight, isTrue);
      verify(mockRepository.createAccount(account)).called(1);
      verifyNoMoreInteractions(mockRepository);
    });

    test('should return Left(Failure) when repository fails', () async {
      // Arrange
      const failure = Failure.unknown(message: 'Repository error');
      when(mockRepository.createAccount(account))
          .thenAnswer((_) async => const Left(failure));

      // Act
      final result = await useCase(account);

      // Assert
      expect(result.isLeft, isTrue);
      expect(result.fold((l) => l, (_) => null), equals(failure));
      verify(mockRepository.createAccount(account)).called(1);
      verifyNoMoreInteractions(mockRepository);
    });
  });
}
