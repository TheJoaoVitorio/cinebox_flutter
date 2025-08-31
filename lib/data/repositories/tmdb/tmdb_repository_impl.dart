import 'dart:developer';

import 'package:cinebox_app_flutter/core/result/result.dart';
import 'package:cinebox_app_flutter/data/exceptions/data_exception.dart';
import 'package:cinebox_app_flutter/data/mappers/movie_mappers.dart';
import 'package:cinebox_app_flutter/data/models/genre/genre.dart';
import 'package:cinebox_app_flutter/data/services/tmdb/tmdb_service.dart';
import 'package:cinebox_app_flutter/domain/models/movie.dart';
import 'package:dio/dio.dart';

import './tmdb_repository.dart';

class TmdbRepositoryImpl implements TmdbRepository {
  final TmdbService _tmdbService;

  TmdbRepositoryImpl({
    required TmdbService tmdbService,
  }) : _tmdbService = tmdbService;

  @override
  Future<Result<List<Movie>>> getPopularMovies({
    String language = 'pt-BR',
    int page = 1,
  }) async {
    try {
      final moviesData = await _tmdbService.getPopularMovies(
        language: language,
        page: page,
      );

      return Success(MovieMappers.mapToMovies(moviesData));
    } on DioException catch (e, s) {
      log(
        'Erro ao buscar filmes populares',
        name: 'TmdbRepository',
        error: e,
        stackTrace: s,
      );
      return Failure(DataException('Erro ao buscar filmes populares'));
    }
  }

  @override
  Future<Result<List<Movie>>> getNowPlayingMovies({
    String language = 'pt-BR',
    int page = 1,
  }) async {
    try {
      final moviesData = await _tmdbService.getNowPlayingMovies(
        language: language,
        page: page,
      );

      return Success(MovieMappers.mapToMovies(moviesData));
    } on DioException catch (e, s) {
      log(
        'Erro ao buscar filmes recentes',
        name: 'TmdbRepository',
        error: e,
        stackTrace: s,
      );
      return Failure(DataException('Erro ao buscar filmes recentes'));
    }
  }

  @override
  Future<Result<List<Movie>>> getTopRatedMovies({
    String language = 'pt-BR',
    int page = 1,
  }) async {
    try {
      final moviesData = await _tmdbService.getTopRatedMovies(
        language: language,
        page: page,
      );

      return Success(MovieMappers.mapToMovies(moviesData));
    } on DioException catch (e, s) {
      log(
        'Erro ao buscar filmes mais votados',
        name: 'TmdbRepository',
        error: e,
        stackTrace: s,
      );
      return Failure(DataException('Erro ao buscar filmes mais votados'));
    }
  }

  @override
  Future<Result<List<Movie>>> getUpComingMovies({
    String language = 'pt-BR',
    int page = 1,
  }) async {
    try {
      final moviesData = await _tmdbService.getUpComingMovies(
        language: language,
        page: page,
      );

      return Success(MovieMappers.mapToMovies(moviesData));
    } on DioException catch (e, s) {
      log(
        'Erro ao buscar filmes ',
        name: 'TmdbRepository',
        error: e,
        stackTrace: s,
      );
      return Failure(DataException('Erro ao buscar filmes mais votados'));
    }
  }

  @override
  Future<Result<List<Genre>>> getGenries() async {
    try {
      final data = await _tmdbService.getMovieGenres();
      final genres = data.genres
          .map((g) => Genre(id: g.id, name: g.name))
          .toList();

      return Success(genres);
    } on DioException catch (e, s) {
      log(
        'Erro ao buscar gêneros',
        name: 'TmdbRepository',
        error: e,
        stackTrace: s,
      );
      return Failure(DataException('Erro ao buscar gêneros'));
    }
  }

  @override
  Future<Result<List<Movie>>> getMoviesByGenre({required int genreId}) async {
    try {
      final data = await _tmdbService.getMoviesByGenre(
        genreId: genreId.toString(),
      );
      return Success(MovieMappers.mapToMovies(data));
    } on DioException catch (e, s) {
      log(
        'Erro ao buscar filmes por gênero',
        name: 'TmdbRepository',
        error: e,
        stackTrace: s,
      );
      return Failure(DataException('Erro ao buscar filmes por gênero'));
    }
  }

  @override
  Future<Result<List<Movie>>> getMoviesBySearch({required String query}) async {
    try {
      final data = await _tmdbService.searchMovies(query: query);
      return Success(MovieMappers.mapToMovies(data));
    } on DioException catch (e, s) {
      log(
        'Erro ao buscar filme por busca',
        name: 'TmdbRepository',
        error: e,
        stackTrace: s,
      );
      return Failure(DataException('Erro ao buscar filme por busca'));
    }
  }
}
