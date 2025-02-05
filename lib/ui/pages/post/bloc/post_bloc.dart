import 'package:ceiba_app/data/repository/post_repository.dart';
import 'package:ceiba_app/domain/model/post/post_model.dart';
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
  }) : super(PostBlocUiState()) {
    _onInit();
  }

  _onInit() async {
    emit(state.copyWith(isLoading: true));
    final localPost = hiveManager.getMany<PostModel>(POST_BOX);
    if (localPost?.isNotEmpty == true) {
      emit(state.copyWith(posts: localPost, isLoading: false));
      return;
    }
    final remotePost = await postRepository.getPosts(PostQuery());
    hiveManager.save(POST_BOX, remotePost);
    emit(state.copyWith(posts: remotePost, isLoading: false));
  }
}
