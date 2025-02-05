import 'package:ceiba_app/ui/utils/constants.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';
import 'package:ceiba_app/domain/model/post/post_model.dart';
part 'api.g.dart';

@RestApi(baseUrl: BASE_URL)
abstract class ApiClient {
  factory ApiClient(Dio dio, {String baseUrl}) = _ApiClient;
  @GET("/users")
  Future<List<PostModel>> getUsers();

  @GET("/posts")
  Future<List<PostModel>> getPosts();

  @GET("/posts")
  Future<List<PostModel>> getUserPost(@Query("userId") int userId);
}
