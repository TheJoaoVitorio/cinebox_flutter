// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'save_favorite_movie.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SaveFavoriteMovie _$SaveFavoriteMovieFromJson(Map<String, dynamic> json) =>
    SaveFavoriteMovie(
      movieId: (json['movieId'] as num).toInt(),
      postUrl: json['postUrl'] as String,
      title: json['title'] as String,
      year: (json['year'] as num).toInt(),
    );

Map<String, dynamic> _$SaveFavoriteMovieToJson(SaveFavoriteMovie instance) =>
    <String, dynamic>{
      'movieId': instance.movieId,
      'postUrl': instance.postUrl,
      'title': instance.title,
      'year': instance.year,
    };
