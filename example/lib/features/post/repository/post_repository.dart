import 'package:http_delegate/model/post.dart';

abstract class UserRepository {
  Future<Post?> getPost();

  Future<List<Post>> getPosts();
}
