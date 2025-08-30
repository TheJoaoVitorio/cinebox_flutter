import 'package:json_annotation/json_annotation.dart';

part 'movie_item.g.dart';

@JsonSerializable()
class MovieItem {
  final int id;
  final String title;
  final String overview;
  final String? posterPath;
  final List<int>? genreIds;
  final String? backdropPath;
  final String? releaseDate;
  final double? voteAverage;

  MovieItem({
    required this.id,
    required this.title,
    required this.overview,
    this.posterPath,
    this.backdropPath,
    this.releaseDate,
    this.voteAverage,
    this.genreIds,
  });
  factory MovieItem.fromJson(Map<String, dynamic> json) =>
      _$MovieItemFromJson(json);

  Map<String, dynamic> toJson() => _$MovieItemToJson(this);
}
