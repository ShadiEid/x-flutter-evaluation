import 'package:bloc_app/models/data/post.dart';
import 'package:dio/dio.dart';
import 'package:dio/src/dio.dart';
import 'package:retrofit/retrofit.dart';
import '../config/env.dart';
part 'post_rest_client.g.dart';

@RestApi(baseUrl: Env.baseUrl + "/posts")
abstract class PostRestClient {
  factory PostRestClient(Dio dio) = _PostRestClient;

  @GET("")
  Future<List<Post>> getPosts({
    @Query("_start") required int start,
    @Query("_limit") int limit = Env.perPage,
  });

  @POST("")
  Future<Post> createPost({
    @Body() required Post post,
  });
}
