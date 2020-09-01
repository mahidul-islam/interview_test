import 'package:interview/models/models.dart';
import 'api.dart';

class UserRepository {
  UserApiProvider userApiProvider = UserApiProvider();

  Future<List<User>> getUsers() async {
    return await userApiProvider.getUsers();
  }
}
