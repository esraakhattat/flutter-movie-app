import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task3/bloc/movies_bloc.dart';
import 'package:task3/bloc/movies_event.dart';
import 'package:task3/presentation/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.deepPurple,
        ),
        home: BlocProvider<MoviesBloc>(
            create: (context) => MoviesBloc()..add(FetchMovies()),
            child: const HomePage()));
  }
}
