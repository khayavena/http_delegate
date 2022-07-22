import 'package:http_example/features/post/bloc/result_status.dart';

import '../domain/post.dart';

class GetUsersState {
  ResultStatus status;
  late List<Post>? posts = [];

  GetUsersState({this.status = ResultStatus.init, this.posts});

  GetUsersState buildWith(
          {required ResultStatus state, required List<Post> results}) =>
      GetUsersState(status: ResultStatus.init, posts: results);
}
