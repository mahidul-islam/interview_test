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

  const UserLoaded({@required this.users}) : assert(users != null);

  @override
  List<Object> get props => users;
}

class UserError extends UserState {}
