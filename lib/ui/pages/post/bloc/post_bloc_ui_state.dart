// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:ceiba_app/domain/model/post/post_model.dart';

class PostBlocUiState {
  final bool isLoading;
  final List<PostModel> posts;

  PostBlocUiState({
    this.isLoading = false,
    this.posts = const [],
  });

  PostBlocUiState copyWith({
    bool? isLoading,
    List<PostModel>? posts,
  }) {
    return PostBlocUiState(
      isLoading: isLoading ?? this.isLoading,
      posts: posts ?? this.posts,
    );
  }
}
