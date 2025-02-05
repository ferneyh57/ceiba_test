import 'package:ceiba_app/domain/model/post/post_model.dart';
import 'package:ceiba_app/ui/config/api/api.dart';
import 'package:ceiba_app/ui/utils/query/post_query.dart';
import 'package:flutter/foundation.dart';

abstract class PostDataSource {
  Future<List<PostModel>> getPosts(PostQuery query);
}

class PostDataSourceImpl extends PostDataSource {
  final ApiClient apiClient;

  PostDataSourceImpl({required this.apiClient});

  @override
  Future<List<PostModel>> getPosts(PostQuery query) async {
    try {
      return apiClient.getPosts(query);
    } catch (e) {
      debugPrint('Error at PostDataSourceImpl getPosts: $e');
      return <PostModel>[];
    }
  }
}
