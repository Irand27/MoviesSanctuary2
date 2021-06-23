import 'model_movie.dart';
import 'movie.dart';
import 'dart:async';

class ControllerMovie {
  final modelMovies = ModelMovies();
  int page = 1;
  List<Movie> movieList = [];

  StreamController<List<Movie>> streamList = StreamController();

  loadMovies() {
    modelMovies.fetchMovies();
    modelMovies.listMovies!.then(
      (value) {
        movieList.addAll(value.movie!);

        streamList.add(movieList);
      },
    );
  }

  Future<Movies>? get searchMovie => modelMovies.listMovies;

  newPage() {
    page++;
    print(page);
    loadMovies();
  }
}
