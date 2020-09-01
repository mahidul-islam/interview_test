import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:interview/bloc/bloc.dart';
import 'package:interview/repository/reposetory.dart';
import 'package:interview/views/detail_page.dart';
// import 'package:interview/models/models.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  UserBloc userBloc;
  @override
  void initState() {
    super.initState();
    userBloc = BlocProvider.of<UserBloc>(context);
  }

  @override
  void dispose() {
    super.dispose();
    userBloc.close();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserBloc, UserState>(
      builder: (context, state) {
        if (state is UserEmpty) {
          print('empty');
          return Center(
            child: Text('Please Load data'),
          );
        }
        if (state is UserLoading) {
          print('Loading');
          return Center(
            child: CircularProgressIndicator(),
          );
        }
        if (state is UserLoaded) {
          return ListView.builder(
            itemCount: state.users.length,
            itemBuilder: (context, index) {
              // List<Post> filteredPosts;
              // for (int i = 0; i < state.posts.length; i++)
              //   if (state.posts[index].userId != state.users[index].id)
              //     filteredPosts.add(state.posts[index]);
              // print(filteredPosts);
              // print("++++++++++++++++++++++++++++++++++++++++++++++++++++++");
              PostRepository repository = PostRepository();
              return ListTile(
                title: Text('${state.users[index].name}'),
                subtitle: Text('${state.users[index].email}'),
                leading: CircleAvatar(
                  child: Icon(Icons.check),
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return BlocProvider(
                          create: (context) => PostBloc(
                            repository: repository,
                            singleUser: state.users[index],
                          )..add(FetchPost()),
                          child: PostView(),
                        );
                      },
                    ),
                  );
                },
              );
            },
          );
        }
        return null;
      },
    );
  }
}
