import 'package:task3/bloc/movies_status.dart';

class MoviesState {
  MoviesResponseStatus? moviesResponseStatus;
  int? code;
  MoviesState({required this.moviesResponseStatus, this.code});
}
