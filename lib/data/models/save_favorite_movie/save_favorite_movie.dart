import 'package:json_annotation/json_annotation.dart';

part 'save_favorite_movie.g.dart';

@JsonSerializable()
class SaveFavoriteMovie {
  final int movie_Id;
  final String post_Url;
  final String title;
  final int year;

  SaveFavoriteMovie({
    required this.movie_Id,
    required this.post_Url,
    required this.title,
    required this.year,
  });

  factory SaveFavoriteMovie.fromJson(Map<String, dynamic> json) =>
      _$SaveFavoriteMovieFromJson(json);

  Map<String, dynamic> toJson() => _$SaveFavoriteMovieToJson(this);
}
