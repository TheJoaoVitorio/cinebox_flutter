import 'package:cinebox_app_flutter/ui/movies/commands/get_movies_by_category_command.dart';
import 'package:cinebox_app_flutter/ui/movies/widgets/movies_box.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MoviesByCategory extends ConsumerStatefulWidget {
  const MoviesByCategory({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _MoviesByCategoryState();
}

class _MoviesByCategoryState extends ConsumerState<MoviesByCategory> {
  @override
  Widget build(BuildContext context) {
    final movies = ref.watch(getMoviesByCategoryCommandProvider);

    return movies.when(
      loading: () => Center(
        child: CircularProgressIndicator(),
      ),

      error: (error, stackTrace) => Padding(
        padding: EdgeInsets.all(20),
        child: Text('Erro ao carregar filmes'),
      ),

      data: (data) {
        if (data == null) {
          return Center(
            child: Text('Nenhum filme encontrado'),
          );
        }

        return Container(
          margin: EdgeInsets.only(top: 10, left: 18, bottom: 130),
          child: Column(
            children: [
              MoviesBox(title: 'Mais Populares', movies: data.popular),
              // MoviesBox(title: 'Em Alta' , movies: data.topRated),
              // MoviesBox(title: 'Lançamentos', movies: data.upComing),
            ],
          ),
        );
      },
    );
  }
}
