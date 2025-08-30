import 'package:cinebox_app_flutter/data/models/movie/movie_item.dart';
import 'package:json_annotation/json_annotation.dart';

part 'movie_response.g.dart';

@JsonSerializable()
class MovieResponse {
  final int page;
  final List<MovieItem> results;
  final int? totalPages;
  final int? totalResults;

  MovieResponse({
    required this.page,
    required this.results,
    this.totalPages,
    this.totalResults,
  });

  factory MovieResponse.fromJson(Map<String, dynamic> json) =>
      _$MovieResponseFromJson(json);

  Map<String, dynamic> toJson() => _$MovieResponseToJson(this);
}
