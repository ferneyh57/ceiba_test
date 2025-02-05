// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:ceiba_app/domain/model/post/post_model.dart';
import 'package:ceiba_app/domain/model/user/user_model.dart';

class PostBlocUiState {
  final bool isLoading;
  final List<PostModel> posts;
  final UserModel? currentUser;
  PostBlocUiState({
    this.isLoading = false,
    this.posts = const [],
    this.currentUser,
  });


  PostBlocUiState copyWith({
    bool? isLoading,
    List<PostModel>? posts,
    UserModel? currentUser,
  }) {
    return PostBlocUiState(
      isLoading: isLoading ?? this.isLoading,
      posts: posts ?? this.posts,
      currentUser: currentUser ?? this.currentUser,
    );
  }
}
