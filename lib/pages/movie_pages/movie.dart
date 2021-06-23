class Movie {
  String? nome;
  String? date;
  String? image;
  double? voteAverage;
  String? overview;

  Movie.fromJson(Map<String, dynamic> json) {
    nome = json['title'];
    date = json['release_date'];
    image = json['poster_path'];
    voteAverage = json["vote_average"].toDouble() ?? 0.0;
    overview = json["overview"];
  }
}

class Movies {
  List<Movie>? movie;

  Movies({
    this.movie,
  });

  Movies.fromJson(Map<String, dynamic> json) {
    final moviesList = json['results'] as List;

    movie = moviesList.map(
      (item) {
        return Movie.fromJson(item);
      },
    ).toList();
  }
}
