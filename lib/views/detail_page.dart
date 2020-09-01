import 'package:flutter/material.dart';
import 'package:interview/models/models.dart';
import 'package:meta/meta.dart';

class PostView extends StatelessWidget {
  final List<Post> posts;
  PostView({@required this.posts});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Post of User'),
      ),
      body: Container(
        child: ListView.builder(
          itemCount: 10,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text('This is it'),
            );
          },
        ),
      ),
    );
  }
}
