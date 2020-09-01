import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';

import 'package:interview/models/models.dart';

abstract class PostState extends Equatable {
  const PostState();

  @override
  List<Object> get props => [];
}

class PostEmpty extends PostState {}

class PostLoading extends PostState {}

class PostLoaded extends PostState {
  final User user;
  final List<Post> posts;

  const PostLoaded({
    @required this.user,
    @required this.posts,
  }) : assert(
          user != null,
          posts != null,
        );

  @override
  List<Object> get props => [user, posts];
}

class PostError extends PostState {}
