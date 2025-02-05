import 'package:ceiba_app/domain/model/user/user_model.dart';
import 'package:ceiba_app/ui/utils/query/post_query.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';
import 'package:ceiba_app/domain/model/post/post_model.dart';
part 'api.g.dart';

@RestApi()
abstract class ApiClient {
  factory ApiClient(Dio dio, {String baseUrl}) = _ApiClient;
  @GET("/users")
  Future<List<UserModel>> getUsers();

  @GET("/posts")
  Future<List<PostModel>> getPosts(@Queries() PostQuery query);

}
