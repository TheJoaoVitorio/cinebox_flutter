// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'save_favorite_movie.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SaveFavoriteMovie _$SaveFavoriteMovieFromJson(Map<String, dynamic> json) =>
    SaveFavoriteMovie(
      movie_Id: (json['movie_id'] as num).toInt(),
      post_Url: json['poster_url'] as String,
      title: json['title'] as String,
      year: (json['year'] as num).toInt(),
    );

Map<String, dynamic> _$SaveFavoriteMovieToJson(SaveFavoriteMovie instance) =>
    <String, dynamic>{
      'movie_id': instance.movie_Id,
      'poster_url': instance.post_Url,
      'title': instance.title,
      'year': instance.year,
    };
