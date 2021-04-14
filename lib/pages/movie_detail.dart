import 'package:flutter/material.dart';
import 'package:http_film/models/movie.dart';

class MovieDetail extends StatelessWidget {
  final Movie movie;
  String imgPath = "https://image.tmdb.org/t/p/w500";

  MovieDetail(this.movie);

  @override
  Widget build(BuildContext context) {
    String path;
    if (movie.posterPath != null) {
      path = imgPath + movie.posterPath;
    } else {
      path =
          'https:/images.freeimages.com/images/large-previews/5eb/movie-clapboard-1184339.jpg';
    }
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: Text(movie.title),
        backgroundColor: Colors.black87,
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.all(16),
                height: height / 1.5,
                child: Image.network(path),
              ),
              Container(
                padding: EdgeInsets.only(left: 20, right: 16, top: 10, bottom: 10),
                child: Text(
                  movie.title,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
              ),
              Container(
                child: Text(movie.overview),
                padding: EdgeInsets.only(left: 20, right: 16),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
