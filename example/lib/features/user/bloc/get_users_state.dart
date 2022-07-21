import 'package:http_example/features/user/bloc/result_status.dart';

import '../domain/user.dart';

class GetUsersState {
  ResultStatus status;
  late List<User>? users = [];

  GetUsersState({this.status = ResultStatus.init, this.users});

  GetUsersState buildWith(
          {required ResultStatus state, required List<User> results}) =>
      GetUsersState(status: ResultStatus.init, users: results);
}
