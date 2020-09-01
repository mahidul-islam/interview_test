import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'bloc.dart';
import 'package:interview/repository/reposetory.dart';
import 'package:interview/models/models.dart';

class PostBloc extends Bloc<PostEvent, PostState> {
  final PostRepository repository;
  final User singleUser;

  PostBloc({@required this.repository, this.singleUser})
      : assert(repository != null, singleUser != null);

  @override
  PostState get initialState => PostEmpty();

  @override
  Stream<PostState> mapEventToState(PostEvent event) async* {
    if (event is FetchPost) {
      yield PostLoading();
      try {
        final List<Post> posts = await repository.getPosts();
        print(posts);
        print('!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!');
        yield PostLoaded(user: singleUser, posts: posts);
      } catch (_) {
        print(_);
        yield PostError();
      }
    }
  }
}
