import 'package:flutter/material.dart';
import 'package:http_film/models/movie.dart';

class MovieDetail extends StatelessWidget {
  final Movie movie;

  MovieDetail(this.movie);

  @override
  Widget build(BuildContext context) {
    String imgPath = "https://image.tmbd.org/t/p/w500";
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
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.all(16),
                height: height / 1.5,
                child: Image.network(imgPath+movie.posterPath, width: 100,),
              ),
              Container(
                child: Image.network(imgPath+movie.posterPath, width: 100,),
                padding: EdgeInsets.only(left: 16, right: 16),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
