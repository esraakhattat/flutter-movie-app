import 'package:task3/model/movies.dart';

abstract class MoviesResponseStatus {}

class Loading extends MoviesResponseStatus {}

class Success extends MoviesResponseStatus {
  MoviesResponse? moviesResponse;
  Success(this.moviesResponse);
}

class Failure extends MoviesResponseStatus {
  String? message;
  Failure(this.message);
}
