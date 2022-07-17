import '../domain/user.dart';

abstract class UserRepository {
  Future<User> getUser();

  Future<List<User>> getUsers();
}
