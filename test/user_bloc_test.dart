import 'package:ceiba_app/data/repository/user_repository.dart';
import 'package:ceiba_app/domain/model/user/user_model.dart';
import 'package:ceiba_app/ui/pages/user/bloc/user_bloc.dart';
import 'package:ceiba_app/ui/pages/user/bloc/user_bloc_ui_state.dart';
import 'package:ceiba_app/ui/utils/constants.dart';
import 'package:ceiba_app/ui/utils/hive_manager.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockHiveManager extends Mock implements HiveManager {}

class MockUserRepository extends Mock implements UserRepository {}

void main() {
  late MockHiveManager mockHiveManager;
  late MockUserRepository mockUserRepository;
  final userMock = [
    UserModel(id: 3, name: 'Alice Brown', email: 'alice.brown@example.com'),
    UserModel(id: 4, name: 'Bob White', email: 'bob.white@example.com'),
  ];
  setUp(() {
    mockHiveManager = MockHiveManager();
    mockUserRepository = MockUserRepository();
  });

  group('UserBloc Tests', () {
    test('Initial state is correct', () {
      final bloc = UserBloc(
        hiveManager: mockHiveManager,
        userRepository: mockUserRepository,
      );
      expect(bloc.state, const UserBlocUiState());
    });

    blocTest<UserBloc, UserBlocUiState>(
      'Emits local users if they are available in Hive and skips remote call',
      build: () {
        when(() => mockHiveManager.getMany<UserModel>(USER_BOX)).thenReturn(userMock);

        return UserBloc(
          hiveManager: mockHiveManager,
          userRepository: mockUserRepository,
        );
      },
      verify: (_) {
        verifyNever(() => mockUserRepository.getUsers());
      },
      act: (bloc) => bloc.onInit(),
      expect: () => [
        const UserBlocUiState(isLoading: true),
        UserBlocUiState(
          isLoading: false,
          users: userMock,
        ),
      ],
    );

    blocTest<UserBloc, UserBlocUiState>(
      'Fetches remote users and saves them in Hive if local users are not available',
      build: () {
        when(() => mockHiveManager.getMany<UserModel>(USER_BOX)).thenReturn([]);
        when(() => mockUserRepository.getUsers()).thenAnswer((_) async => userMock);

        when(() => mockHiveManager.save(USER_BOX, userMock)).thenAnswer((_) async => Future(() => {}));

        return UserBloc(
          hiveManager: mockHiveManager,
          userRepository: mockUserRepository,
        );
      },
      verify: (_) {
        verify(() => mockUserRepository.getUsers()).called(1);
        verify(() => mockHiveManager.save(USER_BOX, userMock)).called(1);
      },
      act: (bloc) => bloc.onInit(),
      expect: () => [
        const UserBlocUiState(isLoading: true),
        UserBlocUiState(
          isLoading: false,
          users: userMock,
        ),
      ],
    );
  });
}
