import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'repository/reposetory.dart';
import 'bloc/bloc.dart';
import 'views/home_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Interview Demo'),
        ),
        body: BlocProvider(
          create: (context) => UserBloc(repository: UserRepository()),
          child: HomePage(),
        ),
      ),
    );
  }
}
