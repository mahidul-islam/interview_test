import 'dart:collection';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'bloc.dart';
import 'package:interview/repository/reposetory.dart';
import 'package:interview/models/models.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  final UserRepository repository;
  HashMap<int, List<Post>> _cachedPosts;

  UserBloc({@required this.repository}) : assert(repository != null) {
    _cachedPosts = HashMap<int, List<Post>>();
  }

  @override
  UserState get initialState => UserEmpty();

  @override
  Stream<UserState> mapEventToState(UserEvent event) async* {
    if (event is FetchUser) {
      yield UserLoading();
      try {
        final List<User> users = await repository.getUsers();
        yield UserLoaded(users: users, cache: _cachedPosts);
      } catch (_) {
        yield UserError();
      }
    }
  }
}
