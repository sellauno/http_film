import 'package:flutter/material.dart';
import 'package:http_film/pages/movie_detail.dart';
import 'package:http_film/service/http_service.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class MovieList extends StatefulWidget {
  @override
  _MovieListState createState() => _MovieListState();
}

class _MovieListState extends State<MovieList> {
  int moviesCount;
  List movies;
  HttpService service;
  String imgPath = 'https://image.tmdb.org/t/p/w500';

  Future initialize() async {
    movies = [];
    movies = await service.getPopularMovies();
    setState(() {
      moviesCount = movies.length;
      movies = movies;
    });
  }

  @override
  void initState() {
    service = HttpService();
    initialize();
    super.initState();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFE0E0E0),
      appBar: AppBar(
        title: Text("Popular Movies"),
        backgroundColor: Colors.black87,
      ),
      body: ListView.builder(
          itemCount: (this.moviesCount == null) ? 0 : this.moviesCount,
          itemBuilder: (context, int position) {
            return Card(
              color: Colors.white,
              elevation: 2.0,
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Image.network(
                      imgPath + movies[position].posterPath,
                      width: 60,
                    ),
                  ),
                  Expanded(
                    child: ListTile(
                      title: Text(movies[position].title),
                      subtitle: Padding(
                        padding: const EdgeInsets.only(top:6.0, right: 5.0),
                        child: Row(
                          children: [
                            RatingBar.builder(
                              ignoreGestures: true,
                              initialRating: movies[position].voteAverage/20,
                              direction: Axis.horizontal,
                              allowHalfRating: true,
                              itemCount: 5,
                              itemPadding: EdgeInsets.symmetric(horizontal: 1.0),
                              itemSize: 12,
                              itemBuilder: (context, _) => Icon(
                                Icons.star,
                                color: Colors.amber
                              ),
                              onRatingUpdate: (rating) {
                                print(rating);
                              },
                            ),
                            Text("  "+(movies[position].voteAverage/10).toString()+"/10")
                          ],
                        ),
                      ),
                      onTap: () {
                        MaterialPageRoute route = MaterialPageRoute(
                            builder: (_) => MovieDetail(movies[position]));
                        Navigator.push(context, route);
                      },
                    ),
                  ),
                ],
              ),
            );
          }),
    );
  }
}
