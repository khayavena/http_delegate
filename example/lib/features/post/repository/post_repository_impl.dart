import 'package:http_delegate/http/http_delegate_exception.dart';
import 'package:http_delegate/http/http_delegate_general_exception.dart';
import 'package:http_delegate/model/post.dart';
import 'package:http_example/features/post/repository/post_repository.dart';

import '../remote_data/remote_post_service.dart';

///Logic for specific data source to be performed here remote or local'
class UserRepositoryImpl implements UserRepository {
  final RemotePostService _postService;

  ///Ready to call endPoints no need to worry about -
  /// Dio and Json(FromJson to json) lib at this moment  delegate does that for you
  UserRepositoryImpl({required RemotePostService postService})
      : _postService = postService;

  ///HttpDelegateGeneralException or HttpDelegateException maybe throw you would like to handle it on repository
  @override
  Future<Post?> getPost() async {
    try {
      return _postService.getPost();
    } on HttpDelegateGeneralException catch (e) {
      return null;
    } on HttpDelegateException catch (e) {
      return null;
    }
  }

  @override
  Future<List<Post>> getPosts() async {
    try {
      final posts = _postService.getPosts();
      return posts;
    } on HttpDelegateGeneralException catch (e) {
      return [];
    } on HttpDelegateException catch (e) {
      return [];
    }
  }
}
