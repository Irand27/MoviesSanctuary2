import 'package:flutter/material.dart';
import 'package:iran_desafio/pages/movie_pages/controller_movie.dart';
import 'package:iran_desafio/pages/movie_pages/details_movie_page.dart';
import 'movie.dart';

class MoviesPage extends StatefulWidget {
  final List<Movie>? listMoviesCards;
  MoviesPage({Key? key, this.listMoviesCards}) : super(key: key);

  @override
  _MoviesPageState createState() => _MoviesPageState();
}

class _MoviesPageState extends State<MoviesPage> {
  final viewModel = ControllerMovie();

  @override
  void initState() {
    super.initState();
    viewModel.loadMovies();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Colors.redAccent, Colors.blue.shade900],
          ),
        ),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: StreamBuilder<List<Movie>>(
              stream: viewModel.streamList.stream,
              builder: (context, snapshot) {
                switch (snapshot.connectionState) {
                  case ConnectionState.none:

                  case ConnectionState.waiting:
                    return Center(
                      child: CircularProgressIndicator(),
                    );

                  default:
                    if (snapshot.hasError) {
                      return Center(
                        child: Text('Erro ao carregar dados!'),
                      );
                    } else {
                      return ListView.builder(
                        itemCount: snapshot.data!.length,
                        itemBuilder: (context, index) {
                          if (index == snapshot.data!.length - 2) {
                            viewModel.newPage();
                          }
                          var movie = snapshot.data![index];
                          return GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => DetailMovie(
                                    description: movie,
                                  ),
                                ),
                              );
                            },
                            child: _movieCard(
                                snapshot.data![index].date!,
                                snapshot.data![index].nome!,
                                snapshot.data![index].image ??
                                    'https://thumbs.dreamstime.com/b/erro-ou-%C3%ADcone-n%C3%A3o-encontrado-no-fundo-cinzento-108178373.jpg'),
                          );
                        },
                        padding: const EdgeInsets.all(8),
                      );
                    }
                }
              }),
        ));
  }

  Widget _movieCard(String data, String movieName, String? image) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 50),
      child: Container(
        height: 300,
        child: Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage('https://image.tmdb.org/t/p/w300/$image'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Positioned(
              top: 8,
              right: 8,
              child: Container(
                alignment: Alignment.center,
                height: 20,
                width: 80,
                color: Color(0x000000).withOpacity(0.6),
                child: Text(
                  data,
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 12,
                  ),
                ),
              ),
            ),
            Positioned(
              bottom: 0,
              child: Container(
                color: Color(0x000000).withOpacity(0.6),
                height: 40,
                width: 250,
                child: Text(
                  movieName,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 22,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
