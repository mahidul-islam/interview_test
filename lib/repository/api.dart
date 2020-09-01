import 'package:interview/models/models.dart';
import 'package:dio/dio.dart';
import 'package:dio_http_cache/dio_http_cache.dart';

class UserApiProvider {
  final String userEndPoint = "https://jsonplaceholder.typicode.com/users";
  // DioCacheManager _dioCacheManager = DioCacheManager(CacheConfig());

  // Options _cacheOptions = buildCacheOptions(Duration(days: 7));

  final Dio _dio = Dio();

  // _dio.interceptors.add(_dioCacheManager.interceptor);

  Future<List<User>> getUsers() async {
    DioCacheManager _dioCacheManager;
    _dioCacheManager = DioCacheManager(CacheConfig());

    Options _cacheOptions = buildCacheOptions(Duration(days: 7));
    _dio.interceptors.add(_dioCacheManager.interceptor);

    try {
      Response response = await _dio.get(userEndPoint, options: _cacheOptions);
      return (response.data as List).map((i) => User.fromJson(i)).toList();
    } catch (error, stacktrace) {
      throw Exception("Exception occured: $error stackTrace: $stacktrace");
    }
  }
}

class PostApiProvider {
  final String postEndPoint = "https://jsonplaceholder.typicode.com/posts";
  final Dio dio = Dio();

  Future<List<Post>> getPosts() async {
    DioCacheManager _dioCacheManager;
    _dioCacheManager = DioCacheManager(CacheConfig());

    Options _cacheOptions = buildCacheOptions(Duration(days: 7));
    dio.interceptors.add(_dioCacheManager.interceptor);

    try {
      Response response = await dio.get(postEndPoint, options: _cacheOptions);
      return (response.data as List).map((i) => Post.fromJson(i)).toList();
    } catch (error, stacktrace) {
      throw Exception("Exception occured: $error stackTrace: $stacktrace");
    }
  }
}
