import 'package:cinebox_app_flutter/core/result/result.dart';
import 'package:cinebox_app_flutter/data/models/genre/genre.dart';
import 'package:cinebox_app_flutter/data/repositories/repositories_providers.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';


part 'get_genres_command.g.dart';

@riverpod
class GetGenresCommand extends _$GetGenresCommand {
  @override
  Future<List<Genre>> build() async {
    final result = await ref.read(tmdbRepositoryProvider).getGenries();
    return switch (result) {
      Success<List<Genre>>(:final value) => value,
      Failure() => [],
    };    
  }
}