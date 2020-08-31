import 'package:equatable/equatable.dart';

class Post extends Equatable {
  int userId;
  String title;
  String description;

  Post({this.userId, this.title, this.description});

  @override
  List<Object> get props => [userId, title, description];

  static Post fromJson(dynamic json) {
    return Post(
      userId: json['userId'],
      title: json['title'],
      description: json['description'],
    );
  }
}
