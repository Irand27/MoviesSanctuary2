import 'dart:convert';
import 'package:http/http.dart' as http;
import 'pages/movie_pages/movie.dart';

class API {
  final authority = 'api.themoviedb.org';
  final path = '/3/movie/upcoming';
  final queryParameters = {
    'api_key': 'a5bc05fb630c9b7fdc560033345fa13e',
  };

  Future<Movies> fetchMovies() async {
    final response =
        await http.get(Uri.https(authority, path, queryParameters));

    if (response.statusCode == 200) {
      return Movies.fromJson(jsonDecode(response.body));
    } else {
      return Future.error('Movie not found');
    }
  }
}
