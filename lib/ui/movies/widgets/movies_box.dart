import 'package:cinebox_app_flutter/domain/models/movie.dart';
import 'package:cinebox_app_flutter/ui/core/widgets/movie_card/movie_card.dart';
import 'package:flutter/material.dart';

class MoviesBox extends StatelessWidget {
  final String title;
  final bool vertical;
  final List<Movie> movies;

  const MoviesBox({
    super.key,
    required this.title,
    this.vertical = false,
    required this.movies,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 20, bottom: 16),
            child: Text(
              title,
              style: TextStyle(
                color: Colors.white,
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.start,
            ),
          ),
          Visibility(
            visible: !vertical,
            replacement: Center(
              child: Wrap(
                spacing: 16,
                runSpacing: 12,
                runAlignment: WrapAlignment.center,
                children: [
                  for (var movie in movies)
                    MovieCard(
                      key: UniqueKey(),
                      id: movie.id,
                      title: movie.title,
                      year:
                          movie.releaseDate != null &&
                              movie.releaseDate!.isNotEmpty
                          ? DateTime.parse(movie.releaseDate!).year.toString()
                          : DateTime.now().year.toString(),
                      imageUrl:
                          'https://images.tmdb.org/t/p/w154/${movie.posterPath}',
                      isFavorite: movie.isFavorite,
                    ),
                ],
              ),
            ),
            child: SizedBox(
              width: MediaQuery.sizeOf(context).width,
              height: 250,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                physics: BouncingScrollPhysics(),
                itemCount: movies.length,
                itemBuilder: (context, index) {
                  final movie = movies[index];

                  return Container(
                    margin: EdgeInsets.only(right: 16),
                    child: MovieCard(
                      key: UniqueKey(),
                      id: movie.id,
                      title: movie.title,
                      year:
                          movie.releaseDate != null &&
                              movie.releaseDate!.isNotEmpty
                          ? DateTime.parse(movie.releaseDate!).year.toString()
                          : DateTime.now().year.toString(),
                      imageUrl:
                          'https://images.tmdb.org/t/p/w154/${movie.posterPath}',
                      isFavorite: movie.isFavorite,
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
