import '../domain/user.dart';

abstract class RemoteUserService {
  Future<User> getUser();

  Future<List<User>> getUsers();
}
