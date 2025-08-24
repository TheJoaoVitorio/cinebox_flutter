import 'package:flutter/material.dart';

class Movie {
  final int id;
  final String title;
  final String overview;
  final String? posterPath;
  final String? releaseDate;
  final double voteAverage;
  final List<int> genreIds;
  final String? backdropPath;
  final bool isFavorite;

  Movie({
    required this.id,
    required this.title,
    required this.overview,
    this.posterPath,
    this.releaseDate,
    required this.voteAverage,
    required this.genreIds,
    this.backdropPath,
    this.isFavorite = false,
  });

  Movie copyWith({
    int? id,
    String? title,
    String? overview,
    ValueGetter<String?>? posterPath,
    ValueGetter<String?>? releaseDate,
    double? voteAverage,
    List<int>? genreIds,
    ValueGetter<String?>? backdropPath,
    bool? isFavorite,
  }) {
    return Movie(
      id: id ?? this.id,
      title: title ?? this.title,
      overview: overview ?? this.overview,
      posterPath: posterPath != null ? posterPath() : this.posterPath,
      releaseDate: releaseDate != null ? releaseDate() : this.releaseDate,
      voteAverage: voteAverage ?? this.voteAverage,
      genreIds: genreIds ?? this.genreIds,
      backdropPath: backdropPath != null ? backdropPath() : this.backdropPath,
      isFavorite: isFavorite ?? this.isFavorite,
    );
  }
}
