import 'package:http_delegate/http/http_delegate_exception.dart';
import 'package:http_delegate/http/http_delegate_general_exception.dart';
import 'package:http_example/features/user/domain/user.dart';
import 'package:http_example/features/user/remote_data/remote_user_service.dart';
import 'package:http_example/features/user/repository/user_repository.dart';

///Logic for specific data source to be performed here remote or local'
class UserRepositoryImpl implements UserRepository {
  final RemoteUserService _userService;

  ///Ready to call endPoints no need to worry about -
  /// Dio and Json(FromJson to json) lib at this moment  delegate does that for you
  UserRepositoryImpl({required RemoteUserService userService})
      : _userService = userService;

  ///HttpDelegateGeneralException or HttpDelegateException maybe throw you would like to handle it on repository
  @override
  Future<User?> getUser() async {
    try {
      return _userService.getUser();
    } on HttpDelegateGeneralException catch (e) {
      return null;
    } on HttpDelegateException catch (e) {
      return null;
    }
  }

  @override
  Future<List<User>> getUsers() async {
    try {
      return _userService.getUsers();
    } on HttpDelegateGeneralException catch (e) {
      return [];
    } on HttpDelegateException catch (e) {
      return [];
    }
  }
}
