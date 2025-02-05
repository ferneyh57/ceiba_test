import 'package:ceiba_app/domain/model/post/post_model.dart';

abstract class PostDataSource {
  Future<List<PostModel>> getPosts();
  Future<List<PostModel>> getUserPost(int userId);
}

class PostDataSourceImpl extends PostDataSource {
  @override
  Future<List<PostModel>> getPosts() {
    throw UnimplementedError();
  }

  @override
  Future<List<PostModel>> getUserPost(int userId) {
    throw UnimplementedError();
  }
}