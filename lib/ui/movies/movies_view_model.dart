import 'package:cinebox_app_flutter/ui/movies/commands/get_movies_by_category_command.dart';
import 'package:cinebox_app_flutter/ui/movies/commands/get_movies_by_genre_command.dart';
import 'package:cinebox_app_flutter/ui/movies/commands/search_movies_by_name_command.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'movies_view_model.g.dart';

enum MoviesViewEnum { byCategory, bySearch, byGenre }

@riverpod
class MoviesViewModel extends _$MoviesViewModel {
  @override
  MoviesViewEnum build() => MoviesViewEnum.byCategory;

  Future<void> setView(MoviesViewEnum view) async {
    state = view;
    await Future.delayed(const Duration(milliseconds: 200));
  }

  Future<void> fetchMoviesByCategory() async {
    await setView(MoviesViewEnum.byCategory);
    ref.read(getMoviesByCategoryCommandProvider.notifier).execute();
  }

  Future<void> fetchMoviesByGenre(int genreId) async {
    await setView(MoviesViewEnum.byGenre);
    ref.read(getMoviesByGenreCommandProvider.notifier).execute(genreId);
  }

  Future<void> fetchMoviesBySearch(String name) async {
    await setView(MoviesViewEnum.bySearch);
    ref.read(searchMoviesByNameCommandProvider.notifier).execute(name);
  }
}
