import 'package:cinebox_app_flutter/data/models/movie/movie_response.dart';
import 'package:cinebox_app_flutter/domain/models/movie.dart';

class MovieMappers {
  static List<Movie> mapToMovies(MovieResponse movieResponse) {
    return movieResponse.results
        .map(
          (reponse) => Movie(
            id: reponse.id,
            title: reponse.title,
            overview: reponse.overview,
            posterPath: reponse.posterPath,
            releaseDate: reponse.releaseDate,
            voteAverage: reponse.voteAverage,
            genreIds: reponse.genreIds ?? [],
            backdropPath: reponse.backdropPath,
          ),
        )
        .toList();
  }
}