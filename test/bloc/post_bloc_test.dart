import 'package:ceiba_app/data/repository/post_repository.dart';
import 'package:ceiba_app/domain/model/post/post_model.dart';
import 'package:ceiba_app/domain/model/user/user_model.dart';
import 'package:ceiba_app/ui/pages/post/bloc/post_bloc.dart';
import 'package:ceiba_app/ui/pages/post/bloc/post_bloc_ui_state.dart';
import 'package:ceiba_app/ui/utils/constants.dart';
import 'package:ceiba_app/ui/utils/hive_manager.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:ceiba_app/ui/utils/query/post_query.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockHiveManager extends Mock implements HiveManager {}

class MockPostRepository extends Mock implements PostRepository {}

void main() {
  late MockHiveManager mockHiveManager;
  late MockPostRepository mockPostRepository;
  final userMock = UserModel(id: 3, name: 'Alice Brown', email: 'alice.brown@example.com');
  final postMocks = [
    PostModel(id: 0, userId: 3, title: 'title', body: 'body'),
    PostModel(id: 1, userId: 3, title: 'title', body: 'body')
  ];
  setUp(() {
    mockHiveManager = MockHiveManager();
    mockPostRepository = MockPostRepository();
  });

  group('PostBñoc Tests', () {
    test('Initial state is correct', () {
      final bloc = PostBloc(
        hiveManager: mockHiveManager,
        postRepository: mockPostRepository,
      );
      expect(bloc.state, const PostBlocUiState());
    });

    blocTest<PostBloc, PostBlocUiState>(
      'Emits local posts if they are available in Hive and skips remote call',
      build: () {
        when(() => mockHiveManager.getMany<PostModel>(POST_BOX)).thenReturn(postMocks);

        return PostBloc(
          hiveManager: mockHiveManager,
          postRepository: mockPostRepository,
        );
      },
      verify: (_) {
        verifyNever(() => mockPostRepository.getPosts(const PostQuery()));
      },
      act: (bloc) => bloc.onInit(userMock),
      expect: () => [
        PostBlocUiState(isLoading: true, currentUser: userMock),
        PostBlocUiState(
          isLoading: false,
          posts: postMocks,
          currentUser: userMock
        ),
      ],
    );

    blocTest<PostBloc, PostBlocUiState>(
      'Fetches remote posts and saves them in Hive if local users are not available',
      build: () {
        when(() => mockHiveManager.getMany<UserModel>(POST_BOX)).thenReturn([]);
        when(() => mockPostRepository.getPosts(const PostQuery())).thenAnswer((_) async => postMocks);

        when(() => mockHiveManager.save(POST_BOX, postMocks)).thenAnswer((_) async => Future(() => {}));

        return PostBloc(
          hiveManager: mockHiveManager,
          postRepository: mockPostRepository,
        );
      },
      verify: (_) {
        verify(() => mockPostRepository.getPosts(const PostQuery())).called(1);
        verify(() => mockHiveManager.save(POST_BOX, postMocks)).called(1);
      },
      act: (bloc) => bloc.onInit(userMock),
      expect: () => [
        PostBlocUiState(isLoading: true, currentUser: userMock),
        PostBlocUiState(
          isLoading: false,
          posts: postMocks,
          currentUser: userMock
        ),
      ],
    );
  });
}
