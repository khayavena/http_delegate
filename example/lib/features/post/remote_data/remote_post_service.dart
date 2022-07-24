import 'package:http_delegate/model/post.dart';

abstract class RemotePostService {
  Future<Post> getPost();

  Future<List<Post>> getPosts();
}
