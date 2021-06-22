import 'package:flutter/material.dart';
import 'package:movie_bloc/model/res/res_list_movie.dart';
import 'package:movie_bloc/network/api.dart';

class DetailMovie extends StatelessWidget {
  final String imageBaseUrl;
  final Result movie;

  DetailMovie(this.imageBaseUrl, this.movie);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Detail Movie"),
      ),
      body: Container(
        margin: EdgeInsets.all(8),
        child: ListView(
          children: [
            Center(
              child: Card(
                elevation: 10,
                child: Padding(
                  padding: EdgeInsets.all(8),
                  child: Column(
                    children: [
                      Image.network('$imageBaseUrl${movie.posterPath}',
                          height: 300),
                      SizedBox(height: 8.0),
                      Center(
                        child: Text(
                          "${movie.title}",textAlign: TextAlign.center,
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 18),
                        ),
                      ),
                      SizedBox(
                        height: 8.0,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              SizedBox(
                                height: 8.0,
                              ),
                              Text(
                                '${movie.popularity}',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.blueGrey),
                              ),
                              SizedBox(
                                height: 4.0,
                              ),
                              Text('Penayangan'),
                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                "${movie.voteAverage}",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.blueGrey),
                              ),
                              SizedBox(
                                height: 4.0,
                              ),
                              Text('Suka'),
                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                "${movie.releaseDate?.year}-${movie.releaseDate?.month}-${movie.releaseDate?.day}",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.blueGrey),
                              ),
                              SizedBox(
                                height: 4.0,
                              ),
                              Text('Release '),
                            ],
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 8.0,
                      ),
                      Divider(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                            margin: EdgeInsets.fromLTRB(15, 0, 0, 0),
                            child: Text(
                              "Description: ",
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.bold),
                            ),
                          ),
                        ],
                      ),
                      Container(
                        margin: EdgeInsets.fromLTRB(16, 8, 16, 0),
                        child: Center(
                            child: Text("${movie.overview}",
                                textAlign: TextAlign.left,
                                style: TextStyle(fontSize: 16))),
                      ),
                    ],
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
