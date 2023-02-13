import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:task3/model/movies.dart';

class ApiService {
  ApiService._();
  static final ApiService api = ApiService._();
  Future<MoviesResponse> fetchMovies() async {
    String url =
        'https://api.themoviedb.org/3/movie/popular?api_key=9dee35d33d48888bd478fed31c90d916';
    http.Response response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      // print(response.body);
      String data = response.body;
      Map<String, dynamic> jsonData = jsonDecode(data);
      return MoviesResponse.fromJson(jsonData);
    } else {
      throw Exception("Can't fetch movie");
    }
  }
}
