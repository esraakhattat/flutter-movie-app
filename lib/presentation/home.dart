import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task3/bloc/movies_bloc.dart';
import 'package:task3/bloc/movies_state.dart';
import 'package:task3/bloc/movies_status.dart';
import 'package:task3/data/datasource/remote/api.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    ApiService.api.fetchMovies();
    return Scaffold(
        appBar: AppBar(
          leading: const Icon(Icons.movie),
          title: const Text('Movies'),
        ),
        body: SafeArea(
          child: Center(
            child: BlocBuilder<MoviesBloc, MoviesState>(
              builder: (context, state) {
                var status = state.moviesResponseStatus;
                if (status is Success) {
                  var moviesResponse = status.moviesResponse!;
                  var movies = moviesResponse.results!;
                  const String base_url = "https://image.tmdb.org/t/p/w500";
                  // print(movies);
                  return GridView.builder(
                      itemCount: movies.length,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          childAspectRatio: (MediaQuery.of(context).size.width /
                              MediaQuery.of(context).size.height),
                          crossAxisCount: 2),
                      itemBuilder: (context, index) => SizedBox(
                            height: 600,
                            child: Card(
                              semanticContainer: true,
                              clipBehavior: Clip.antiAliasWithSaveLayer,
                              child: Column(children: [
                                Image.network(
                                  '$base_url${movies[index].posterPath!}',
                                  width: 250,
                                ),
                                Text(
                                  movies[index].title!,
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold),
                                ),
                              ]),
                            ),
                          ));
                } else if (status is Failure) {
                  var message = status.message!;
                  return Text(message);
                } else {
                  return const CircularProgressIndicator();
                }
              },
            ),
          ),
        ));
  }
}
