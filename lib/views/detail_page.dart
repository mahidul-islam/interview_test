import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:interview/bloc/bloc.dart';

class PostView extends StatefulWidget {
  @override
  _PostViewState createState() => _PostViewState();
}

class _PostViewState extends State<PostView> {
  PostBloc postBloc;

  @override
  void initState() {
    super.initState();
    postBloc = BlocProvider.of<PostBloc>(context);
  }

  @override
  void dispose() {
    super.dispose();
    postBloc.close();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Posts Of User'),
      ),
      body: BlocBuilder<PostBloc, PostState>(
        builder: (context, state) {
          if (state is PostEmpty) {
            print('post empty');
            return Center(
              child: Text('Load Post'),
            );
          }
          if (state is PostLoading) {
            print('loading post');
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          if (state is PostLoaded) {
            print('post loaded');
            return ListView.builder(
              itemCount: state.posts.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text('${state.posts[index].title}'),
                  subtitle: Text('${state.posts[index].description}'),
                );
              },
            );
          }
          if (state is PostError) {
            print('post error');
            return Center(
              child: Text('There is no Internet Connection'),
            );
          }
          return Container(
            width: 0,
            height: 0,
          );
        },
      ),
    );
  }
}
