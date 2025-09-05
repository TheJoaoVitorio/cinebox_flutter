// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie_item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MovieItem _$MovieItemFromJson(Map<String, dynamic> json) => MovieItem(
  id: (json['id'] as num).toInt(),
  title: json['title'] as String,
  overview: json['overview'] as String,
  posterPath: json['posterPath'] as String?,
  backdropPath: json['backdropPath'] as String?,
  releaseDate: json['releaseDate'] as String?,
  voteAverage: (json['voteAverage'] as num?)?.toDouble(),
  genreIds: (json['genreIds'] as List<dynamic>?)
      ?.map((e) => (e as num).toInt())
      .toList(),
);

Map<String, dynamic> _$MovieItemToJson(MovieItem instance) => <String, dynamic>{
  'id': instance.id,
  'title': instance.title,
  'overview': instance.overview,
  'posterPath': instance.posterPath,
  'genreIds': instance.genreIds,
  'backdropPath': instance.backdropPath,
  'releaseDate': instance.releaseDate,
  'voteAverage': instance.voteAverage,
};
