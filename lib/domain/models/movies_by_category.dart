
import 'package:cinebox_app_flutter/domain/models/movie.dart';

class MoviesByCategory {
  final List<Movie> nowPlaying;
  final List<Movie> topRated;
  final List<Movie> upComing;
  final List<Movie> popular;

  MoviesByCategory({
    required this.nowPlaying,
    required this.topRated,
    required this.upComing,
    required this.popular,
  });
}