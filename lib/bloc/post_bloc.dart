import 'dart:collection';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'bloc.dart';
import 'package:interview/repository/reposetory.dart';
import 'package:interview/models/models.dart';

class PostBloc extends Bloc<PostEvent, PostState> {
  final PostRepository repository;
  final User singleUser;
  HashMap<int, List<Post>> cachedPosts;

  PostBloc({
    @required this.repository,
    @required this.singleUser,
    @required this.cachedPosts,
  }) : assert(repository != null, singleUser != null);

  @override
  PostState get initialState => PostEmpty();

  @override
  Stream<PostState> mapEventToState(PostEvent event) async* {
    if (event is FetchPost) {
      yield PostLoading();
      try {
        if (!cachedPosts.containsKey(singleUser.id)) {
          print('+++++++++++++++++++++++++++++++++++++++++++');
          final List<Post> posts = await repository.getPosts();
          cachedPosts[singleUser.id] = posts;
        }
        yield PostLoaded(user: singleUser, posts: cachedPosts[singleUser.id]);
      } catch (_) {
        print(_);
        yield PostError();
      }
    }
  }
}
