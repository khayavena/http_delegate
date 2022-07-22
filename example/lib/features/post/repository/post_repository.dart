import '../domain/post.dart';

abstract class UserRepository {
  Future<Post?> getPost();

  Future<List<Post>> getPosts();
}
