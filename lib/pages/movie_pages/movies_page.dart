import 'package:flutter/material.dart';

class MoviesPage extends StatelessWidget {
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
          body: ListView(
            padding: const EdgeInsets.all(8),
            children: [
              // Card(
              //   child: ListTile(
              //     leading: FlutterLogo(),
              //     title: Text('One-line ListTile'),
              //   ),
              // ),
              _movieCard('2021-03-24', 'Godzilla vs. Kong',
                  'https://wallpaperaccess.com/full/3239722.jpg'),
              _movieCard('2021-03-03', 'Tarzan',
                  'https://lh3.googleusercontent.com/proxy/5TgrkCVmyoYDLL6Y_gqAi68zCmSSSX9xE5lKdqgN-quCl9RfNGGIL_QodVy1lJHYtxyDBlD_rteZXdks8a798-kuFCLp9VQvpS_jHQ'),
            ],
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
                  image: NetworkImage(image),
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
