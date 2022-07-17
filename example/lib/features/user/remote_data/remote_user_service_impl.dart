import 'package:http_delegate/http/http_req_delegate.dart';
import 'package:http_example/features/user/domain/user.dart';
import 'package:http_example/features/user/remote_data/remote_user_service.dart';

class RemoteUserServiceImpl implements RemoteUserService {
  final HttpReqDelegate _reqDelegate;

  ///Ready to call endPoints no need to worry about -
  /// Dio and Json(FromJson to json) lib at this moment  delegate does that for you
  RemoteUserServiceImpl({required HttpReqDelegate reqDelegate})
      : _reqDelegate = reqDelegate;

  ///HttpDelegateGeneralException or HttpDelegateException maybe throw you would like to handle it on repository
  @override
  Future<User> getUser() {
    return _reqDelegate.get<User>('endPoint');
  }

  @override
  Future<List<User>> getUsers() {
    return _reqDelegate.get<List<User>>('endPoint');
  }
}
