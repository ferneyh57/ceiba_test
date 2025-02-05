import 'package:ceiba_app/data/datasource/post_data_source.dart';
import 'package:ceiba_app/domain/model/post/post_model.dart';
import 'package:ceiba_app/ui/utils/query/post_query.dart';

abstract class PostRepository {
  Future<List<PostModel>> getPosts(PostQuery query);
}

class PostRepositoryImpl extends PostRepository {
  final PostDataSource postDataSource;

  PostRepositoryImpl({required this.postDataSource});

  @override
  Future<List<PostModel>> getPosts(PostQuery query) {
    return postDataSource.getPosts(query);
  }
}
