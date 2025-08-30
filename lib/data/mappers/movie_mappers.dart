import 'package:cinebox_app_flutter/data/models/movie/movie_response.dart';
import 'package:cinebox_app_flutter/domain/models/movie.dart';

class MovieMappers {
  static List<Movie> mapToMovies(MovieResponse movieResponse) {
    return movieResponse.results
        .map(
          (response) => Movie(
            id: response.id,
            title: response.title,
            overview: response.overview,
            posterPath: response.posterPath,
            releaseDate: response.releaseDate,
            voteAverage: response.voteAverage ?? 0.0,
            genreIds: response.genreIds ?? [],
            backdropPath: response.backdropPath,
          ),
        )
        .toList();
  }
}