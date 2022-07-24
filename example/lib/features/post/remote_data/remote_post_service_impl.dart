import 'package:http_delegate/http/http_req_delegate.dart';
import 'package:http_delegate/model/post.dart';
import 'package:http_example/features/post/remote_data/remote_post_service.dart';

class RemoteUserServiceImpl implements RemotePostService {
  final HttpReqDelegate _reqDelegate;

  ///Ready to call endPoints no need to worry about -
  /// Dio and Json(FromJson to json) lib at this moment  delegate does that for you
  RemoteUserServiceImpl({required HttpReqDelegate reqDelegate})
      : _reqDelegate = reqDelegate;

  ///HttpDelegateGeneralException or HttpDelegateException maybe throw you would like to handle it on repository
  @override
  Future<Post> getPost() async {
    final post = await _reqDelegate.get<Post>('/post');
    return post;
  }

  @override
  Future<List<Post>> getPosts() async {
    final posts = _reqDelegate.get<List<Post>>('/posts');
    return posts;
  }
}
