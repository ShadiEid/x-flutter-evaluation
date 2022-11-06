import 'package:bloc_app/models/data/post.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:lazy_evaluation/lazy_evaluation.dart';
import '../network/post_rest_client/post_rest_client.dart';

class PostRepository {
  final _postRestClient = Lazy<PostRestClient>(() => PostRestClient(GetIt.I.get<Dio>()));
  PostRestClient get postRestClient => _postRestClient.value;

  Future<List<Post>> getPosts({required int page}) async {
    try {
      final resposne = await postRestClient.getPosts(start: page);
      return resposne;
    } catch (error) {
      return [];
    }
  }

  Future<Post?> createPost({required String title, required String description}) async {
    try {
      return await postRestClient.createPost(post: Post(userId: 1, title: title, body: description));
    } catch (error) {
      throw Exception(error);
    }
  }
}
