import 'package:cinebox_app_flutter/data/models/genre/genre_response.dart';
import 'package:cinebox_app_flutter/data/models/movie/movie_response.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'tmdb_service.g.dart';

@RestApi()
abstract class TmdbService {
  factory TmdbService(Dio dio, {String baseUrl}) = _TmdbService;

  @GET('/genre/movie/list')
  Future<GenreResponse> getMovieGenres({@Query('language') String language = 'pt-BR'});

  @GET('/movie/popular')
  Future<MovieResponse> getPopularMovies({
    @Query('language') String language = 'pt-BR',
    @Query('page') int page = 1,
  });

  @GET('/movie/top_rated')
  Future<MovieResponse> getTopRatedMovies({
    @Query('language') String language = 'pt-BR',
    @Query('page') int page = 1,
  });

  @GET('/movie/now_playing')
  Future<MovieResponse> getNowPlayingMovies({
    @Query('language') String language = 'pt-BR',
    @Query('page') int page = 1,
  });

  @GET('/movie/upcoming')
  Future<MovieResponse> getUpComingMovies({
    @Query('language') String language = 'pt-BR',
    @Query('page') int page = 1,
  });
}
