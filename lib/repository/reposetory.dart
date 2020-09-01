import 'package:interview/models/models.dart';
import 'package:meta/meta.dart';
import 'api.dart';

class UserRepository {
  UserApiProvider userApiProvider = UserApiProvider();

  Future<List<User>> getUsers() async {
    return await userApiProvider.getUsers();
  }

  Future<List<Post>> getPosts() async {
    List<Post> posts = await userApiProvider.getPosts();
    return posts;
  }
}

class PostRepository {
  PostApiProvider postApiProvider = PostApiProvider();
  User user;
  PostRepository({@required this.user});

  Future<List<Post>> getPosts() async {
    List<Post> posts = await postApiProvider.getPosts();
    posts.removeWhere((Post post) => post.userId != user.id);
    posts.sort((Post a, Post b) => a.title.length.compareTo(b.title.length));
    return posts;
  }
}
