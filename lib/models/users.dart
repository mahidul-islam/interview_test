import 'package:equatable/equatable.dart';

class User extends Equatable {
  final int id;
  final String name;
  final String email;

  User({this.id, this.name, this.email});

  @override
  List<Object> get props => [id, name, email];

  static User fromJson(dynamic json) {
    return User(
      id: json['id'],
      name: json['name'],
      email: json['email'],
    );
  }
}
