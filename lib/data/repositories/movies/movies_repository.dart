import 'package:cinebox_app_flutter/core/result/result.dart';
import 'package:cinebox_app_flutter/domain/models/favorite_movie.dart';

abstract interface class MoviesRepository {
  Future<Result<List<FavoriteMovie>>> getMyFavoritesMovies();
}