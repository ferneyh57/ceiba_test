import 'package:ceiba_app/data/datasource/post_data_source.dart';
import 'package:ceiba_app/domain/model/post/post_model.dart';

abstract class PostRepository {
  Future<List<PostModel>> getPosts();
  Future<List<PostModel>> getUserPost(int userId);
}

class PostRepositoryImpl extends PostRepository {
  final PostDataSource postDataSource;

  PostRepositoryImpl({required this.postDataSource});

  @override
  Future<List<PostModel>> getPosts() {
    return postDataSource.getPosts();
  }

  @override
  Future<List<PostModel>> getUserPost(int userId) {
    return postDataSource.getUserPost(userId);
  }
}
