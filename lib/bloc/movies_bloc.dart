import 'package:task3/bloc/movies_event.dart';
import 'package:task3/bloc/movies_state.dart';
import 'package:bloc/bloc.dart';
import 'package:task3/bloc/movies_status.dart';
import 'package:task3/data/datasource/remote/api.dart';
import 'package:task3/model/movies.dart';

class MoviesBloc extends Bloc<MoviesEvent, MoviesState> {
  MoviesBloc() : super(MoviesState(moviesResponseStatus: Loading())) {
    on<FetchMovies>((event, emit) => _fetchMovies(event));
  }

  _fetchMovies(FetchMovies event) async {
    try {
      emit(MoviesState(moviesResponseStatus: Loading()));
      MoviesResponse moviesResponse = await ApiService.api.fetchMovies();
      emit(MoviesState(moviesResponseStatus: Success(moviesResponse)));
    } catch (e) {
      emit(MoviesState(moviesResponseStatus: Failure(e.toString())));
    }
  }
}
