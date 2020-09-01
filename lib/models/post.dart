import 'package:equatable/equatable.dart';

class Post extends Equatable {
  final int userId;
  final String title;
  final String description;

  Post({this.userId, this.title, this.description});

  @override
  List<Object> get props => [userId, title, description];

  static Post fromJson(dynamic json) {
    print('I think error is here');
    return Post(
      userId: json['userId'],
      title: json['title'],
      description: json['body'],
    );
  }
}
