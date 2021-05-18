class Movie {
  String nome;
  String date;
  String image;

  Movie.fromJson(Map<String, dynamic> json) {
    nome = json['title'];
    date = json['release_date'];
    image = json['poster_path'];
  }
}

class Movies {
  List<Movie> movie;

  Movies.fromJson(Map<String, dynamic> json) {
    var moviesList = json['results'] as List;
    movie = moviesList.map((item) {
      return Movie.fromJson(item);
    }).toList();
  }
}
