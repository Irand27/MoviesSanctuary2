import 'package:iran_desafio/API.dart';
import 'movie.dart';

class ModelMovies {
  Future<Movies>? listMovies;

  Future<Movies>? get list_Movies => listMovies;

  fetchMovies() {
    listMovies = API().fetchMovies();
  }
}
