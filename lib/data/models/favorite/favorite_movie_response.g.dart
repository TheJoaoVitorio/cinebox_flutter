// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'favorite_movie_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FavoriteMovieResponse _$FavoriteMovieResponseFromJson(
  Map<String, dynamic> json,
) => FavoriteMovieResponse(
  movieId: (json['movieId'] as num).toInt(),
  posterUrl: json['posterUrl'] as String,
  title: json['title'] as String,
  year: (json['year'] as num).toInt(),
);

Map<String, dynamic> _$FavoriteMovieResponseToJson(
  FavoriteMovieResponse instance,
) => <String, dynamic>{
  'movieId': instance.movieId,
  'posterUrl': instance.posterUrl,
  'title': instance.title,
  'year': instance.year,
};
