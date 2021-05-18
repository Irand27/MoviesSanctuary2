import 'model_movie.dart';
import 'movie.dart';

class ControllerMovie {
  final modelMovies = ModelMovies();

  loadMovies() {
    modelMovies.fetchMovies();
  }

  Future<Movies> get searchMovie => modelMovies.listMovies;
}
