import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:interview/bloc/bloc.dart';

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
  Widget build(BuildContext context) {
    return BlocBuilder<UserBloc, UserState>(
      bloc: userBloc,
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
              return ListTile(
                title: Text('${state.users[index].name}'),
                subtitle: Text('${state.users[index].email}'),
                leading: CircleAvatar(
                  child: Icon(Icons.check),
                ),
                onTap: () {},
              );
            },
          );
          // return Text('hello');
        }
        return Text('hello hello');
      },
    );
  }
}
