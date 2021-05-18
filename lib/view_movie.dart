import 'package:Iran_desafio/pages/movie_pages/controller_movie.dart';
import 'package:flutter/material.dart';
import 'pages/movie_pages/movie.dart';
import 'pages/movie_pages/movies_page.dart';
import 'pages/proflie_page.dart';

class MoviesSanctuary extends StatefulWidget {
  @override
  _MoviesSanctuaryState createState() => _MoviesSanctuaryState();
}

class _MoviesSanctuaryState extends State<MoviesSanctuary> {
  final ControllerMovie controller = ControllerMovie();

  @override
  Widget build(BuildContext context) {
    controller.loadMovies();
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.redAccent,
          elevation: 0,
          bottom: TabBar(
            labelColor: Colors.redAccent,
            unselectedLabelColor: Colors.white,
            indicatorSize: TabBarIndicatorSize.label,
            indicator: BoxDecoration(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10),
                    topRight: Radius.circular(10)),
                color: Colors.white),
            tabs: [
              Tab(
                child: Align(
                  alignment: Alignment.center,
                  child: Text("MOVIES"),
                ),
              ),
              Tab(
                child: Align(
                  alignment: Alignment.center,
                  child: Text("PROFILE"),
                ),
              ),
            ],
          ),
        ),
        body: TabBarView(children: [
          FutureBuilder<Movies>(
            future: controller.searchMovie,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return MoviesPage(
                  listMoviesCards: snapshot.data.movie,
                );
              }
            },
          ),
          ProfilePage(),
        ]),
      ),
    );
  }
}
