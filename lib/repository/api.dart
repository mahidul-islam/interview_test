import 'package:interview/models/models.dart';
import 'package:dio/dio.dart';

class UserApiProvider {
  final String userEndPoint = "https://jsonplaceholder.typicode.com/users";
  final String postEndPoint = "https://jsonplaceholder.typicode.com/posts";
  final Dio dio = Dio();

  Future<List<User>> getUsers() async {
    try {
      Response response = await dio.get(userEndPoint);
      return (response.data as List).map((i) => User.fromJson(i)).toList();
    } catch (error, stacktrace) {
      throw Exception("Exception occured: $error stackTrace: $stacktrace");
    }
  }

  Future<List<Post>> getPosts() async {
    try {
      Response response = await dio.get(postEndPoint);
      print('+++++++++++++++++++++++++++++++++++++++++++++++++++++');
      print(response.data);
      print('+++++++++++++++++++++++++++++++++++++++++++++++++++++');
      return (response.data as List).map((i) => Post.fromJson(i)).toList();
    } catch (error, stacktrace) {
      throw Exception("Exception occured: $error stackTrace: $stacktrace");
    }
  }
}
