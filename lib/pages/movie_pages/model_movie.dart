import 'package:Iran_desafio/API.dart';
import 'movie.dart';

class ModelMovies {
  Future<Movies> _listMovies;

  Future<Movies> get listMovies => _listMovies;

  fetchMovies() {
    _listMovies = API().fetchMovies();
  }
}
