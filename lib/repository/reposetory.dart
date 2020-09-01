import 'package:interview/models/models.dart';
import 'api.dart';

class UserRepository {
  UserApiProvider userApiProvider = UserApiProvider();

  Future<List<User>> getUsers() async {
    return await userApiProvider.getUsers();
  }

  Future<List<Post>> getPosts() async {
    List<Post> posts = await userApiProvider.getPosts();
    // posts.removeWhere((Post post) => post.userId != user.id);
    return posts;
  }
}

class PostRepository {
  UserApiProvider userApiProvider = UserApiProvider();
  User user;
  PostRepository({this.user});

  Future<List<Post>> getPosts() async {
    List<Post> posts = await userApiProvider.getPosts();
    // posts.removeWhere((Post post) => post.userId != user.id);
    return posts;
  }
}
