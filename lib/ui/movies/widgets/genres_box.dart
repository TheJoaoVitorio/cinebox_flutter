import 'package:cinebox_app_flutter/ui/core/themes/colors.dart';
import 'package:cinebox_app_flutter/ui/movies/commands/get_genres_command.dart';
import 'package:cinebox_app_flutter/ui/movies/movies_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class GenresBox extends ConsumerWidget {
  static final selectedGenre = ValueNotifier<int>(0);

  const GenresBox({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final genres = ref.watch(getGenresCommandProvider);

    return genres.when(
      loading: () => SizedBox(
        height: 34,
        child: Center(
          child: CircularProgressIndicator(),
        ),
      ),
      error: (error, stackTrace) => SizedBox(
        height: 34,
        child: Center(
          child: Text('Erro ao carregar gêneros'),
        ),
      ),
      data: (data) {
        if (data.isEmpty) {
          return SizedBox(
            height: 34,
            child: Center(
              child: Text('Nenhum gênero encontrado'),
            ),
          );
        }

        return SizedBox(
          height: 34,
          child: ListView.builder(
            padding: EdgeInsets.only(left: 20),
            scrollDirection: Axis.horizontal,
            physics: BouncingScrollPhysics(),
            itemCount: data.length,
            itemBuilder: (context, index) {
              final genre = data[index];
              return InkWell(
                onTap: () {
                  selectedGenre.value = genre.id;

                  ref
                      .read(moviesViewModelProvider.notifier)
                      .fetchMoviesByGenre(genre.id);
                },
                child: ValueListenableBuilder(
                  valueListenable: selectedGenre,
                  builder: (context, value, child) {
                    final isSelected = value == genre.id;
                    return Container(
                      margin: EdgeInsets.only(right: 10),
                      padding: EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 6,
                      ),
                      decoration: BoxDecoration(
                        color: isSelected
                            ? AppcColors.colorPrimary
                            : AppcColors.bgColorSecondary,
                        borderRadius: BorderRadius.circular(30),
                        border: Border.all(
                          color: isSelected
                              ? AppcColors.colorPrimary
                              : const Color.fromARGB(255, 64, 64, 64),
                          width: 1,
                        ),
                      ),
                      child: Text(
                        data[index].name,
                        style: TextStyle(
                          color: isSelected ? Colors.white : Colors.white54,
                          fontWeight: isSelected
                              ? FontWeight.bold
                              : FontWeight.normal,
                          fontSize: 14,
                        ),
                      ),
                    );
                  },
                ),
              );
            },
          ),
        );
      },
    );
  }
}
