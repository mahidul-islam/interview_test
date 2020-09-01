import 'package:interview/models/models.dart';
import 'package:dio/dio.dart';

class UserApiProvider {
  final String endPoint = "https://jsonplaceholder.typicode.com/users";
  final Dio dio = Dio();

  Future<List<User>> getUsers() async {
    try {
      Response response = await dio.get(endPoint);
      print(response);
      return (response.data as List).map((i) => User.fromJson(i)).toList();
    } catch (error, stacktrace) {
      throw Exception("Exception occured: $error stackTrace: $stacktrace");
    }
  }
}
