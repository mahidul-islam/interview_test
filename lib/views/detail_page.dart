import 'package:flutter/material.dart';
import 'package:interview/models/models.dart';
import 'package:meta/meta.dart';

class PostView extends StatelessWidget {
  final List<Post> posts;
  final User user;
  PostView({@required this.posts, @required this.user});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Post of User'),
      ),
      body: Container(
        child: ListView.builder(
          itemCount: posts.length,
          itemBuilder: (context, index) {
            if (posts[index].userId == user.id) {
              return ListTile(
                title: Text(
                  '${posts[index].title}',
                  style: TextStyle(fontSize: 18),
                ),
                subtitle: Text('${posts[index].description}'),
              );
            }
            return SizedBox(height: 0, width: 0);
          },
        ),
      ),
    );
  }
}
