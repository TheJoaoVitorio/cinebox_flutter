import 'package:cinebox_app_flutter/ui/movies/commands/search_movies_by_name_command.dart';
import 'package:cinebox_app_flutter/ui/movies/widgets/movies_box.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MoviesBySearch extends ConsumerStatefulWidget {
  const MoviesBySearch({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _MoviesBySearchState();
}

class _MoviesBySearchState extends ConsumerState<MoviesBySearch> {
  @override
  Widget build(BuildContext context) {
    final movies = ref.watch(searchMoviesByNameCommandProvider);

    return movies.when(
      loading: () => Center(
        child: CircularProgressIndicator(),
      ),

      error: (error, stackTrace) => Padding(
        padding: EdgeInsets.all(20),
        child: Text('Erro ao buscar filme por nome'),
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
