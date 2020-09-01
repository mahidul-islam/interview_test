import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';

import 'package:interview/models/models.dart';

abstract class UserState extends Equatable {
  const UserState();

  @override
  List<Object> get props => [];
}

class UserEmpty extends UserState {}

class UserLoading extends UserState {}

class UserLoaded extends UserState {
  final List<User> users;
  final List<Post> posts;

  const UserLoaded({
    @required this.users,
    @required this.posts,
  }) : assert(
          users != null,
          posts != null,
        );

  @override
  List<Object> get props => [users, posts];
}

class UserError extends UserState {}
