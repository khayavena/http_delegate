import '../domain/post.dart';

abstract class RemotePostService {
  Future<Post> getPost();

  Future<List<Post>> getPosts();
}
