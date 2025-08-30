import 'package:cinebox_app_flutter/ui/movies/commands/get_movies_by_genre_command.dart';
import 'package:cinebox_app_flutter/ui/movies/widgets/movies_box.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MoviesByGender extends ConsumerWidget {
  const MoviesByGender({super.key});

  @override
  Widget build(BuildContext contextm, WidgetRef ref) {
    final movies = ref.watch(getMoviesByGenreCommandProvider);

    return movies.when(
      loading: () => Center(
        child: CircularProgressIndicator(),
      ),

      error: (error, stackTrace) => Padding(
        padding: EdgeInsets.all(20),
        child: Text('Erro ao carregar filmes'),
      ),

      data: (data) {
        if (data == null || data.isEmpty) {
          return Center(
            child: Text('Nenhum filme encontrado'),
          );
        }

        return Container(
          margin: EdgeInsets.only(bottom: 130),
          child: MoviesBox(
            title: 'Filmes encontrados',
            movies: data,
            vertical: true,
          ),
        );
      },
    );
  }
}
