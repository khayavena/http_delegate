import 'package:http_example/features/user/domain/user.dart';
import 'package:http_example/features/user/remote_data/remote_user_service.dart';
import 'package:http_example/features/user/repository/user_repository.dart';

class UserRepositoryImpl implements UserRepository {
  final RemoteUserService _userService;

  ///Ready to call endPoints no need to worry about -
  /// Dio and Json(FromJson to json) lib at this moment  delegate does that for you
  UserRepositoryImpl({required RemoteUserService userService})
      : _userService = userService;

  ///HttpDelegateGeneralException or HttpDelegateException maybe throw you would like to handle it on repository
  @override
  Future<User> getUser() {
    return _userService.getUser();
  }

  @override
  Future<List<User>> getUsers() {
    return _userService.getUsers();
  }
}
