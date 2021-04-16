import 'package:flutter/material.dart';
import 'package:http_film/models/movie.dart';

class MovieDetail extends StatelessWidget {
  final Movie movie;
  String imgPath = "https://image.tmdb.org/t/p/w500";

  MovieDetail(this.movie);

  @override
  Widget build(BuildContext context) {
    String path;
    String poster;
    if (movie.backdropPath != null) {
      path = imgPath + movie.backdropPath;
    } else {
      path =
          'https:/images.freeimages.com/images/large-previews/5eb/movie-clapboard-1184339.jpg';
    }
    if (movie.posterPath != null) {
      poster = imgPath + movie.posterPath;
    } else {
      poster =
          'https:/images.freeimages.com/images/large-previews/5eb/movie-clapboard-1184339.jpg';
    }
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Color(0xFF303030),
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
                height: height / 2,
                child: Image.network(path),
              ),
              Container(
                padding: EdgeInsets.only(left: 20, right: 16, bottom: 10),
                child: Row(
                  children: [
                    Image.network(poster, width: 40),
                    Text(
                      "  "+movie.title,
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20, color: Colors.white),
                    ),
                  ],
                ),
              ),
              Container(
                child: Text(
                  movie.overview,
                  style: TextStyle(color: Colors.white),
                ),
                width: 450,
                padding: EdgeInsets.only(left: 20, right: 16),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
