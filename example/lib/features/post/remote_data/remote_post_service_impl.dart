import 'package:http_delegate/http/http_req_delegate.dart';
import 'package:http_example/features/post/remote_data/remote_post_service.dart';

import '../domain/post.dart';

class RemoteUserServiceImpl implements RemotePostService {
  final HttpReqDelegate _reqDelegate;

  ///Ready to call endPoints no need to worry about -
  /// Dio and Json(FromJson to json) lib at this moment  delegate does that for you
  RemoteUserServiceImpl({required HttpReqDelegate reqDelegate})
      : _reqDelegate = reqDelegate;

  ///HttpDelegateGeneralException or HttpDelegateException maybe throw you would like to handle it on repository
  @override
  Future<Post> getPost() {
    return _reqDelegate.get<Post>('/post');
  }

  @override
  Future<List<Post>> getPosts() {
    return _reqDelegate.get<List<Post>>('/posts');
  }
}
