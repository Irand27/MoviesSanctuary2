import 'package:flutter/material.dart';
import 'movie.dart';

class MoviesPage extends StatelessWidget {
  final List<Movie> listMoviesCards;
  MoviesPage({Key key, this.listMoviesCards}) : super(key: key);
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
          body: ListView.builder(
            itemCount: listMoviesCards.length,
            itemBuilder: (context, index) {
              return _movieCard(listMoviesCards[index].date,
                  listMoviesCards[index].nome, listMoviesCards[index].image);
            },
            padding: const EdgeInsets.all(8),
          )),
    );
  }

  Padding _movieCard(String data, String movieName, String image) {
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
