import 'package:ceiba_app/data/repository/post_repository.dart';
import 'package:ceiba_app/domain/model/post/post_model.dart';
import 'package:ceiba_app/domain/model/user/user_model.dart';
import 'package:ceiba_app/ui/pages/post/bloc/post_bloc_ui_state.dart';
import 'package:ceiba_app/ui/utils/constants.dart';
import 'package:ceiba_app/ui/utils/hive_manager.dart';
import 'package:ceiba_app/ui/utils/query/post_query.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PostBloc extends Cubit<PostBlocUiState> {
  final HiveManager hiveManager;
  final PostRepository postRepository;

  PostBloc({
    required this.hiveManager,
    required this.postRepository,
  }) : super(PostBlocUiState());

  onInit(UserModel currentUser) async {
    emit(state.copyWith(isLoading: true, currentUser: currentUser));
    final localPost = hiveManager.getMany<PostModel>(POST_BOX);
    if (localPost?.isNotEmpty == true) {
      emit(state.copyWith(posts: localPost, isLoading: false));
      return;
    }
    final remotePost = await postRepository.getPosts(PostQuery());
    hiveManager.save(POST_BOX, remotePost);
    emit(state.copyWith(posts: remotePost, isLoading: false));
  }

// This is helpful for filtering the posts of the current user.
// In this case the api respponse for all post is small so we can filter it here.
// In a real case escenario we should filter this in the backend sending the user id as a query parameter.
// The {PostQuery} class is a helper class to build the query parameters.
  List<PostModel> get currentUserPosts {
    return state.posts.where((element) => element.userId == state.currentUser?.id).toList();
  }
}
