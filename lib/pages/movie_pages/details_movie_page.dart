import 'package:flutter/material.dart';
import 'package:iran_desafio/pages/movie_pages/movie.dart';

class DetailMovie extends StatelessWidget {
  const DetailMovie({Key? key, this.description}) : super(key: key);
  final Movie? description;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: MediaQuery.of(context).size.height * 0.70,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(
                      'https://image.tmdb.org/t/p/w300' + description!.image!),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Container(
              height: 50,
              child: Text(
                description!.nome!,
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
            ),
            Container(
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Container(
                        child: Text(
                          description!.date!,
                          style: TextStyle(fontSize: 20),
                        ),
                        margin: EdgeInsets.symmetric(vertical: 30),
                      ),
                      Container(
                        child: Column(
                          children: [
                            Text(
                              '${description!.voteAverage}',
                              style: TextStyle(fontSize: 20),
                            ),
                            Text('Score'),
                          ],
                        ),
                      ),
                      Container(
                        width: 10,
                        height: 10,
                        color: Colors.white,
                      ),
                    ],
                  ),
                  Container(
                    child: Text(
                      description!.overview!,
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
