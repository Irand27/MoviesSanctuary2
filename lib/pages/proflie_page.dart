import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              height: 150.0,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [Colors.redAccent, Colors.pinkAccent],
                ),
              ),
              child: Container(
                child: Center(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CircleAvatar(
                        backgroundImage: NetworkImage(
                            'https://media-exp1.licdn.com/dms/image/C5603AQFVJ9YATqQ0Cw/profile-displayphoto-shrink_800_800/0/1596509239787?e=1626912000&v=beta&t=-UqinBWAvuko_v4c7EIyP6a9Kg7SrH8NuMfV8g2Dr9g'),
                        radius: 50,
                      ),
                      SizedBox(height: 10),
                      Text(
                        'Iran Dias',
                        style: TextStyle(
                          fontSize: 22,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      )
                    ],
                  ),
                ),
              ),
            ),
            Container(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 30, horizontal: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Bio',
                      style: TextStyle(
                        color: Colors.redAccent,
                        fontStyle: FontStyle.normal,
                        fontSize: 28,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      'Sou estudante de Ciência da Computação, apaixonado por desenvolvimento mobile! \n'
                      'Atuo como presidente da RAS UNIFACS, bolsista na Hub Salvador e cursando na Cubos Academy.',
                      style: TextStyle(
                        fontSize: 16,
                        fontStyle: FontStyle.italic,
                        fontWeight: FontWeight.w300,
                        color: Colors.black,
                        letterSpacing: 2,
                      ),
                    )
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              width: 300,
              child: ElevatedButton(
                onPressed: () {
                  _launchURL();
                },
                child: Ink(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                      colors: [Colors.pinkAccent, Colors.redAccent],
                    ),
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: Container(
                    constraints: BoxConstraints(maxWidth: 300, minHeight: 50),
                    alignment: Alignment.center,
                    child: Text(
                      'See my LinkedIn!',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 24,
                          letterSpacing: 2,
                          fontWeight: FontWeight.w300),
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  _launchURL() async {
    const url = 'https://www.linkedin.com/in/irandias27/';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}
