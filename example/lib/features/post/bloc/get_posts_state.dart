import 'package:http_delegate/model/post.dart';
import 'package:http_example/features/post/bloc/result_status.dart';

class GetPostsState {
  ResultStatus status;
  List<Post> posts = [];

  GetPostsState({this.status = ResultStatus.init, this.posts = const []});

  GetPostsState buildWith(
      {required ResultStatus state, required List<Post> results}) {
    return GetPostsState(status: state, posts: results);
  }
}
